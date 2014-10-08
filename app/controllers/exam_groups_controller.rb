class ExamGroupsController < ApplicationController
 
   def select
    @course=Course.find(params[:course][:id])
    @batches=@course.batches.all

  end

  def new
    @batch=Batch.find(params[:format])
    @exam_group=@batch.exam_groups.build
    @course=@batch.course
  end

  def create
    @batch=Batch.find(params[:format])
    @exam_group=@batch.exam_groups.new(params_exam_group)
    @exam_group.save
    @subjects=@batch.subjects.where(no_exams:false)
    @exam_group.exams.build
  end

  def edit
    @exam_group=ExamGroup.find(params[:id])
    @batch=@exam_group.batch
  end

  def update
    @exam_group=ExamGroup.find(params[:id])
    @exam_group.update(params_exam_group)
    @batch=@exam_group.batch
    @subjects=@batch.subjects.where(no_exams:false)
    @exam_group.exams.build
  end

  def exam_group_create
    @exam_group=ExamGroup.find(params[:id])
    @exam_group.update(params_exam_group)
      if params[:no_create].present?
        params[:no_create].each do |s|
          @exam=Exam.find_by_subject_id_and_exam_group_id(s,@exam_group.id)
          unless @exam.nil?
            @exam.destroy
          end
        end      
      end
  end
  
  def show
    @batch=Batch.find(params[:id])
    @exam_groups=@batch.exam_groups.all
    @course=@batch.course
  end

  def exams
   @exam_group=ExamGroup.find(params[:id])
   @exams=@exam_group.exams.all
   @course=@exam_group.batch.course
   
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

  def publish_exam
    @exam_group=ExamGroup.find(params[:format])
    @exam_group.update(is_published:true)
    @exam_group.exams.each do |exam|
        exam.create_exam_event
      end
    @batch=@exam_group.batch
    @exam_groups=@batch.exam_groups.all

  end

  def publish_result
    @exam_group=ExamGroup.find(params[:format])
    if @exam_group.is_published?
       @exam_group.update(result_published:true)
       flash[:result]="Result published successfully"
    else
       flash[:result_error]="Exam scheduled not published"
    end
    redirect_to exam_groups_exams_path(@exam_group)
  end

  def destroy
    @exam_group=ExamGroup.find(params[:id])
    batch=@exam_group.batch
    @exam_group.destroy
    flash[:notice] = "Exam Group deleted successfully!"
    redirect_to exam_group_path(batch)
  end

 
  private 
    def params_exam_group
      params.require(:exam_group).permit(:name,:exam_type,
        exams_attributes: [:subject_id,:maximum_marks,:minimum_marks,:start_time,:end_time])
    end
end
  