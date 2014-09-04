class ExamReportsController < ApplicationController
 
  def exam_wise_report
  	@batches=Batch.all
 	@batch=Batch.first
 	@subjects=@batch.subjects.all
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
