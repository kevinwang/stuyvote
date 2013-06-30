class ElectionsController < ApplicationController
  before_filter :authenticate_admin!

  def new
    @election = Election.new
  end

  def create
    @election = Election.new params[:student]
    if @election.save
      flash[:notice] = 'Election created successfully.'
      redirect_to @election
    else
      flash[:alert] = @student.errors.full_messages.join('<br>').html_safe
      render :new_election
    end
  end

  def update
    @election = Election.find params[:id]
    if @election.update_attributes params[:election]
      flash[:notice] = 'Election updated successfully.'
      redirect_to @election
    else
      flash[:alert] = @student.errors.full_messages.join('<br>').html_safe
      render :edit_election
    end
  end

  def edit
    @election = Election.find params[:id]
  end

  def destroy
    @election.find(params[:id]).destroy
    flash[:notice] = 'Election deleted successfully.'
    redirect_to :controller => 'elections', :action => 'index'
  end

  def index
    @elections = Election.all
  end

  def show
    @election = Election.find params[:id]
  end
end
