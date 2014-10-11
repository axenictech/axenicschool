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
    @exams=[]
    flag=false
    @exam_group=ExamGroup.find(params[:exam_group][:id])
    exams_data=@exam_group.exams.all
    
    exams_data.each do |exam|
      exam.exam_scores.each do |es|
        if es.is_failed?
        flag=true   
        end         
       end
      if flag == true
        @exams<< exam
      end
     end
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
    @date=Date.today
    @exam_group=ExamGroup.find(params[:format])
    @exam_group.update(is_published:true)
    @exam_group.exams.each do |exam|
        exam.create_exam_event
    end    
    @batch=@exam_group.batch
    @exam_groups=@batch.exam_groups.all
  end

  def publish_result
    flag=false
    @exam_group=ExamGroup.find(params[:format])
    if @exam_group.is_published? 
      @exam_group.exams.each do |exam|
        if exam.end_time >= Date.today
        flag=true
        end         
      end
      
      if flag==true  
       flash[:result_error] ="Exam results cannot be published"
      else
       @exam_group.update(result_published:true)
       flash[:result]="Result published successfully"
      end
       
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

  def previous_exam_scores
    @exam=Exam.find(params[:format])
    @exam_scores=@exam.exam_scores.where(is_failed:true)

  end

  def update_exam_score
    @exam=Exam.find(params[:id])
    @exam_group=@exam.exam_group
    @batch=@exam_group.batch
    params[:exams][:exam].each_pair do |student_id, details|
        @exam_score=ExamScore.find_by_exam_id_and_student_id(@exam.id,student_id)
        @grouped_exam=GroupedExamReport.find_by_batch_id_and_student_id_and_exam_group_id_and_subject_id(@batch.id,student_id,@exam_group.id,@exam.subject_id)
        score_grade=""
        fail=false
        fail=true if details[:marks].to_f<@exam.minimum_marks.to_f
      
      unless @exam.exam_group.exam_type=="Marks"
        percentage=(details[:marks].to_f*100)/@exam.maximum_marks.to_f
        grades=@exam.exam_group.batch.grading_levels.all
        grades.each do |grade|
          if percentage>=grade.min_score
            score_grade=grade.id
          end
        end
      end
      
          if @exam_score.nil?
            ExamScore.create(exam_id:@exam.id,student_id:student_id,
              marks:details[:marks],remarks:details[:remarks],grading_level_id:score_grade,is_failed:fail)
          else
            @exam_score.update(marks:details[:marks],remarks:details[:remarks],grading_level_id:score_grade,is_failed:fail)
          end

          if @grouped_exam.nil?
            GroupedExamReport.create(batch_id:@batch.id,student_id:student_id,
              exam_group_id:@exam_group.id,subject_id:@exam.subject_id,marks:details[:marks])
          else
            @grouped_exam.update(marks:details[:marks])
          end
      end
      redirect_to exam_groups_previous_exam_scores_path(@exam.id)
  end

  private 

    def params_exam_group
      params.require(:exam_group).permit(:name,:exam_type,:exam_date,
        exams_attributes:[:subject_id,:maximum_marks,:minimum_marks,:start_time,:end_time])
    end
end
  