class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Election.find(params[:election_id]).candidates.new params[:candidate]
    if @candidate.save
      flash[:notice] = 'Candidate added successfully.'
      redirect_to controller: 'elections', action: 'show', id: params[:election_id]
    else
      flash.now[:alert] = @candidate.errors.full_messages.join('<br>').html_safe
      render action: 'new'
    end
  end

  def edit
    @candidate = Candidate.find params[:id]
  end

  def update
    @candidate = Candidate.find params[:id]
    if @candidate.update_attributes params[:candidate]
      flash[:notice] = 'Candidate updated successfully.'
      redirect_to @candidate.election
    else
      flash[:alert] = @candidate.errors.full_messages.join('<br>').html_safe
      render :edit_candidate
    end
  end

  def destroy
    candidate = Candidate.find(params[:id])
    election_id = candidate.election_id
    candidate.destroy
    flash[:notice] = 'Candidate deleted successfully.'
    redirect_to controller: 'elections', action: 'show', id: election_id
  end
end
