require 'digest/md5'

class VotesController < ApplicationController
  def swipe
  end

  def new
    if params[:osis].length == 12
      redirect_to root_url, :notice => 'Wrong barcode, flip your card over.'
      return
    end

    @student = Student.where(:osis_digest => Digest::MD5.hexdigest(params[:osis])).first
    if not @student
      redirect_to root_url, :notice => 'Student does not exist.'
      return
    end

    @elections = @student.elections.select { |election| Vote.where('student_id = ?', @student.id).where(:candidate_id => election.candidates).count < election.num_choices }
    if @elections.empty?
      redirect_to root_url, :notice => 'You have already voted in all available elections.'
    end
  end

  def create
    elections = params.select { |key, value| key.to_s.match /^election_\d+/ }
    elections.keys.each do |key|
      election_id = /\d+$/.match key
      elections[key].each do |candidate_id|
        @vote = Student.find(params[:student_id]).votes.build
        @vote.candidate = Candidate.find(candidate_id)
        if @vote.save
          redirect_to root_url, :notice => 'You have successfully voted.'
        else
          flash[:notice] = 'Something went wrong!'
          render :action => 'new'
        end
      end
    end
  end
end
