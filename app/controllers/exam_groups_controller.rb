class ExamGroupsController < ApplicationController
 
  def select
    @course=Course.find(params[:course][:id])
    @batches=@course.batches.all

  end

  def new
    @batch=Batch.find(params[:format])
    @exam_group=@batch.exam_groups.build
  end

  def create
    @batch=Batch.find(params[:format])
    @exam_group=@batch.exam_groups.new(params_exam_group)
    @exam_group.save
    @subjects=@batch.subjects.all
    @exam_group.exams.build
   end

  def exam_group_create
    @exam_group=ExamGroup.find(params[:id])
    @exam_group.update(params_exam_group)
    redirect_to exam_group_path(@exam_group.batch)
  end
  
  def show

    @batch=Batch.find(params[:id])
    @exam_groups=@batch.exam_groups.all
  end

  def exams

   @exam_group=ExamGroup.find(params[:id])
   @exams=@exam_group.exams.all
    
  end

  private 
  def params_exam_group
    params.require(:exam_group).permit(:name,:exam_type,
      exams_attributes: [:subject_id,:maximum_marks,:minimum_marks,:start_time,:end_time])
  end

end
  