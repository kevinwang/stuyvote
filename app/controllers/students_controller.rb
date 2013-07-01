require 'csv'

class StudentsController < ApplicationController
  before_filter :authenticate_admin!

  def index
  end

  def create
    students = []
    parse_ok = true
    line_num = 0
    begin
      CSV.parse(params[:list].read) do |row|
        line_num += 1
        osis_digest = row[0]
        grade = row[1]

        if row.length == 2 and osis_digest and grade and osis_digest.length == 32 and grade.to_i.between?(9, 12)
          students << Student.new(osis_digest: osis_digest, grade: grade)
        else
          parse_ok = false
          flash[:alert] = 'Bad CSV file! No changes have been made to the database.'
        end
      end
    rescue
      parse_ok = false
      flash[:alert] = 'Bad CSV file! No changes have been made to the database.'
    end
    if parse_ok
      Student.delete_all
      students.each do |s|
        s.save
      end
      flash[:notice] = 'Successfully updated student database.'
    end
    redirect_to :controller => 'students', :action => 'index'
  end

  def destroy
  end
end
