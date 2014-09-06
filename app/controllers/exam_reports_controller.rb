class ExamReportsController < ApplicationController
 
  def exam_wise_report
  	@batches=Batch.all
 	  @batch=Batch.first
 	  @exam_groups=@batch.exam_groups.all
  end

  def genrate_reports
 			
  end

  def genrate_previous_reports
  	
  end

  def select
  	@course=Course.find(params[:exam][:course_id])
  	@batches=@course.batches.all
  end

  def select_batch
    @batch=Batch.find(params[:batch_select][:id])
    @exam_groups=@batch.exam_groups.all
  end

  def generate_exam_report
    
     @exam_group=ExamGroup.find(params[:exam_group_select][:id])
     @batch=@exam_group.batch
     @student=@batch.students.last
  end

  def student_exam_report
      @exam_group=ExamGroup.find(params[:exam_group_id])
      @student=Student.find(params[:student_id])
  end

  def consolidated_report
       @exam_group=ExamGroup.find(params[:exam_group_id])
       @batch=@exam_group.batch
  end

end
