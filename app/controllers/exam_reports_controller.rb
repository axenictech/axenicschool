class ExamReportsController < ApplicationController
  def index
  end

  def genrate_reports
 			
  end

  def genrate_previous_reports
  	
  end

  def select
  	@course=Course.find(params[:exam][:course_id])
  	@batches=@course.batches.all
  end
end
