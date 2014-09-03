class ExamReportsController < ApplicationController
 
  def exam_wise_report
  	@batches=Batch.all
 	@batch=Batch.first
 	@subjects=@batch.subjects.all
  end
  
end
