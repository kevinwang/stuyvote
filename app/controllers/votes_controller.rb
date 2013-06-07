require 'digest/md5'

class VotesController < ApplicationController
  def swipe
  end

  def new
    if params[:osis].length == 12
      redirect_to root_url, :notice => 'Wrong barcode, flip your card over'
      return
    end

    @student = Student.where(:osis_digest => Digest::MD5.hexdigest(params[:osis])).first
    if not @student
      redirect_to root_url, :notice => 'Student does not exist'
      return
    end

    @vote = @student.votes.build
    puts @vote
  end

  def create
  end
end
