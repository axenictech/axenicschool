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

  def previous_exam
    @course=Course.find(params[:course][:id])
    @batches=@course.batches.all
  end

  def previous_exam_group
    @batch=Batch.find(params[:batch][:id])
    @exam_groups=@batch.exam_groups.all
  end

  def previous_exam_details
    @exam_group=ExamGroup.find(params[:exam_group][:id])
    @exams=@exam_group.exams.all
  end
  
  def connect_exam
   @batch=Batch.find(params[:format])
   @exam_groups=@batch.exam_groups.all
  end

  def assign_all
   @batch=Batch.find(params[:format])
   @exam_groups=@batch.exam_groups.all
  
  end

  def remove_all
    @batch=Batch.find(params[:format])
    @exam_groups=@batch.exam_groups.all
  end 

  def update_connect_exam
    sum=0
    @batch=Batch.find(params[:format])
    exam_groups=params[:exam_groups]
    if exam_groups.present?
      params[:exam_group].each_pair do |e,w|
        sum+=w[:weightage].to_f
      end
      if sum==100 
        params[:exam_group].each_pair do |e,w|
          exam_groups.each do |eg|
              if eg==e
                exams=Exam.where(exam_group_id:eg)
                exams.each do |exam|
                  exam.update(weightage:w[:weightage])
                flash[:notice_con]="Total weightage updated successfully"
                end
              end
          end
        end
      else
        flash[:notice_connect]="Total weightage should be 100"
      end
    else
      flash[:notice_connect]="Please select exam group"
    end
    redirect_to exam_groups_connect_exam_path(@batch)  
  end

  private 
  def params_exam_group
    params.require(:exam_group).permit(:name,:exam_type,
      exams_attributes: [:subject_id,:maximum_marks,:minimum_marks,:start_time,:end_time])
  end

end
  