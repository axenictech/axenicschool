class StudentsController < ApplicationController

  def admission1
    
    @student = Student.new
    if Student.first.nil?
      @student.admission_no=111
    else
      @last_student=Student.last
      @student.admission_no=@last_student.admission_no.next
    end 	
    
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash[:notice] = "Student Reord saved successfully please fill the parent detail"

      redirect_to students_admission2_path(@student)
    else
      render 'admission1'
    end
  end
  def show
    @student =Student.find(params[:id])
  end

  def admission2
    @student=Student.find(params[:format])
    @guardian=@student.guardians.build

  end

  def admission2_1
    @student=Student.find(params[:format])

  end

  def admission3
    @student=Student.find(params[:format])
  end


  def edit
    @student=Student.find(params[:id])
  end
  
  def update
    @student=Student.find(params[:id])
    if @student.update(student_params)
     flash[:notice] = "Student Reord updated successfully "

    redirect_to students_profile_path(@student)
    else
      render 'edit'
    end
  end

  def update_immediate_contact
    @student=Student.find(params[:id])
    @student.update(student_params)
    @guardian=Guardian.find(@student.immediate_contact)
    @guardian.create_user_account
    redirect_to students_previous_data_path(@student)
  end

  def edit_immediate_contact
    @student=Student.find(params[:format])
  end

  def update_immediatecontact
    @student=Student.find(params[:id])
    @student.update(student_params)
    @guardian=Guardian.find(@student.immediate_contact)
    @guardian.create_user_account
    redirect_to students_profile_path(@student)
  end

  def previous_data
    @student=Student.find(params[:format])
    @previous_data=StudentPreviousData.new
  end

  def previous_data_create
    @previous_data=StudentPreviousData.create(previous_data_params)
    @student=Student.find(params[:student_previous_data][:student_id])

    if @previous_data.save
      redirect_to students_profile_path(@student)
    else
      render :template => 'students/previous_data',:object =>'@student'
    end
  end

  def previous_subject
    @student=Student.find(params[:format])
    @previous_subject=StudentPreviousSubjectMark.new
  end

  def previous_subject_create
    @previous_subject=StudentPreviousSubjectMark.create(params_subject)
    @student=params[:student_previous_subject_mark][:student_id]
     @previous_subjects=StudentPreviousSubjectMark.where(student_id: @student)
  end


  def search_ajax
    unless params[:search].empty?
      if params[:student][:status].eql? "present"
        @students=Student.where("concat_ws(' ',first_name,last_name)like '#{params[:search]}%' 
        OR concat_ws(' ',last_name,first_name)like '#{params[:search]}%' OR admission_no like '#{params[:search]}%'")
      end  
      if params[:student][:status].eql? "former"
        @students=ArchivedStudent.where("concat_ws(' ',first_name,last_name)like '#{params[:search]}%' 
        OR concat_ws(' ',last_name,first_name)like '#{params[:search]}%' OR admission_no like '#{params[:search]}%'")
      end 
    end
  end

  def view_all
    @batches=Batch.all
  end

  def select
    @batch=Batch.find(params[:batch][:id])
    @students=@batch.students.all
  end

  def profile
    @student=Student.find(params[:id])
    @immediate_contact=Guardian.find(@student.immediate_contact)
  end

  def student_profile
    @student=Student.find(params[:id])
    @immediate_contact=Guardian.find(@student.immediate_contact)
    @student_previous_data=StudentPreviousData.find_by_student_id(@student.id)
    @student_previous_subject_marks=StudentPreviousSubjectMark.where(student_id:@student.id)
    @general_setting=GeneralSetting.first
    render 'student_profile',layout:false
  end

  def archived_profile
    @student=ArchivedStudent.find(params[:format])
    @immediate_contact=Guardian.find(@student.immediate_contact)
    @student_previous_data=StudentPreviousData.find_by_student_id(@student.student_id)
    @student_previous_subject_marks=StudentPreviousSubjectMark.where(student_id:@student.student_id)
  end

  def archived_student_profile
    @student=ArchivedStudent.find(params[:id])
    @immediate_contact=Guardian.find(@student.immediate_contact)
    @student_previous_data=StudentPreviousData.find_by_student_id(@student.student_id)
    @student_previous_subject_marks=StudentPreviousSubjectMark.where(student_id:@student.student_id)
    @general_setting=GeneralSetting.first
    render 'student_profile',layout:false
  end

  def report
    @student=Student.find(params[:format])
    @batch=@student.batch
  end

  def archived_report
    @student=ArchivedStudent.find(params[:format])
    @batch=@student.batch
    @exam_groups=@batch.exam_groups.all
  end

  def recent_exam_report
    @exam_group=ExamGroup.find(params[:exam_group_id])
    @student=Student.find(params[:student_id])
    @batch=@exam_group.batch
  end

  def student_exam_report
    @exam_group=ExamGroup.find(params[:exam_group_id])
    @student=Student.find(params[:student_id])
    @batch=@exam_group.batch
    @general_setting=GeneralSetting.first
    render 'student_exam_report',layout:false
  end

  def subject_wise_report
    @subject=Subject.find(params[:subject_id])
    @student=Student.find(params[:student_id])
    @batch=@subject.batch
    @exam_groups=@batch.exam_groups.all
  end

  def academic_report
    @subject=Subject.find(params[:subject_id])
    @student=Student.find(params[:student_id])
    @batch=@subject.batch
    @exam_groups=@batch.exam_groups.all
    @general_setting=GeneralSetting.first
    render 'academic_report',layout:false
  end

  def final_report
    @student=Student.find(params[:format])
    @batch=@student.batch
    @exam_groups=@batch.exam_groups.all
    @subjects=@batch.subjects.all
  end

  def student_final_report
    @student=Student.find(params[:student_id])
    @batch=@student.batch
    @exam_groups=@batch.exam_groups.all
    @subjects=@batch.subjects.all
    @general_setting=GeneralSetting.first
    render 'student_final_report',layout:false
  end

  def transcript_report
    @student=Student.find(params[:format])
    @batch=@student.batch
    @exam_groups=@batch.exam_groups.all
  end

  def student_transcript_report
    @student=Student.find(params[:student_id])
    @batch=@student.batch
    @exam_groups=@batch.exam_groups.all
    @general_setting=GeneralSetting.first
    render 'student_transcript_report',layout:false
  end

  def archived_student_transcript_report
    @student=ArchivedStudent.find(params[:student_id])
    @batch=@student.batch
    @exam_groups=@batch.exam_groups.all
    @general_setting=GeneralSetting.first
    render 'archived_student_transcript_report',layout:false
  end

  def attendance_report
    @student=Student.find(params[:format])
    @batch=@student.batch
    @subjects=@batch.subjects.all
  end

  def genrate_report
    @student=Student.find(params[:report][:student_id])
    @subject_id=params[:report][:subject_id]
    @start_date=params[:report][:start_date]
    @end_date=params[:report][:end_date]
    @batch_events=@student.batch.batch_events.all
    @time_table_entries=TimeTableEntry.where(subject_id:@subject_id,batch_id:@student.batch.id)
   end

  def advanced_search
    @courses=Course.all
    @batches=Course.first.batches.all
  end
  
  def batch_details
    @course=Course.find(params[:id])
    @batches=@course.batches.all
  end
  
  def advanced_student_search
    conditions=""
    conditions+="concat_ws(' ',first_name,last_name) like '#{params[:search][:name]}%'" unless params[:search][:name]==""
    if params[:batch][:id]
      if conditions==""
        conditions+="batch_id = #{params[:batch][:id]}" unless params[:batch][:id]==""
      else
        conditions+=" AND batch_id = #{params[:batch][:id]}" unless params[:batch][:id]==""
      end
    end
    if params[:search][:category_id]
      if conditions==""
        conditions+="category_id = #{params[:search][:category_id]}" unless params[:search][:category_id]==""
      else
        conditions+=" AND category_id = #{params[:search][:category_id]}" unless params[:search][:category_id]==""
      end
    end
    if params[:search][:gender]
      unless params[:search][:gender].eql? "All"
        if conditions==""
           conditions+="gender like '#{params[:search][:gender]}'"
        else
           conditions+=" AND gender like '#{params[:search][:gender]}'"
        end
      end
    end
    if params[:search][:blood_group]
      if conditions==""
        conditions+="blood_group like '#{params[:search][:blood_group]}'" unless params[:search][:blood_group]==""
      else
        conditions+=" AND blood_group like '#{params[:search][:blood_group]}'" unless params[:search][:blood_group]==""
      end
    end
    if params[:search][:country_id]
      if conditions==""
        conditions+="nationality_id ='#{params[:search][:country_id]}'" unless params[:search][:country_id]==""
      else
        conditions+=" AND nationality_id ='#{params[:search][:country_id]}'" unless params[:search][:country_id]==""
      end
    end
    if params[:search][:admission_date]
      if conditions==""
        conditions+="admission_date ='#{params[:search][:admission_date]}'" unless params[:search][:admission_date]==""
      else
        conditions+=" AND admission_date ='#{params[:search][:admission_date]}'" unless params[:search][:admission_date]==""
      end
    end
    if params[:search][:date_of_birth]
      if conditions==""
        conditions+="date_of_birth = '#{params[:search][:date_of_birth]}'" unless params[:search][:date_of_birth]==""
      else
        conditions+=" AND date_of_birth = '#{params[:search][:date_of_birth]}'" unless params[:search][:date_of_birth]==""

      end
    end
    if params[:search][:status]
      if params[:search][:status]=="all"
        @student1=Student.where(conditions)
        @student2=ArchivedStudent.where(conditions)
        @students=@student1+@student2  
      elsif params[:search][:status]=="present"
        @students=Student.where(conditions)
      else
        @students=ArchivedStudent.where(conditions)
      end
    end
     @search = ''
      @search += " Name: " + params[:search][:name].to_s+", " unless params[:search][:name].empty?
        if params[:search][:course_id].present?
          course = Course.find(params[:search][:course_id])
          @search += " Course: " + course.course_name+", " unless course.nil?
        end
        if params[:batch][:id].present?
           batch = Batch.find(params[:batch][:id])
           @search += " Batch: " + batch.name+", " unless batch.nil?
        end 
        if params[:search][:category_id].present?     
           @search += " Category: " + Category.find(params[:search][:category_id]).name+", "
        end
        if  params[:search][:gender] == 'All'
          @search += " Gender: All"+", "
        else
          @search += " Gender: "+params[:search][:gender].to_s+", " unless params[:search][:gender].empty?
        end
      @search += " Blood group: " + params[:search][:blood_group].to_s+", " unless params[:search][:blood_group].empty?
      if params[:search][:country_id].present?
         @search += " Country: " + Country.find(params[:search][:country_id]).name+", "
      end
      @search += " Admission date: " +  params[:search][:admission_date].to_s+", " unless  params[:search][:admission_date].empty?
      @search += " Date of birth: " +  params[:search][:date_of_birth].to_s+", " unless  params[:search][:date_of_birth].empty?
      if params[:search][:status]=="present"
        @search += " Present student"
      elsif params[:search][:status]=="former"
        @search += " Former student"
      else
        @search += " All student"
      end
  end

  def advanced_search_result
    @students=params[:students]
    @search=params[:search]
    @general_setting=GeneralSetting.first
    render 'advanced_search_result',layout:false
  end

  def elective
    @subject=Subject.find(params[:subject_id])
    @students=@subject.elective_group.batch.students.all 
  end

  def assign_all
    @subject=Subject.find(params[:subject_id])
    @students=@subject.elective_group.batch.students.all 
  end
  
  def remove_all
    @subject=Subject.find(params[:subject_id])
    @students=@subject.elective_group.batch.students.all 
  end
  
  def assign_elective

      @subject= Subject.find(params[:student_subject][:subject_id])
      @batch=@subject.elective_group.batch
      @student_subject_delete= StudentSubject.where(subject_id: @subject.id)
      students=[]
      students= params[:students]
      if students.present?
         unless @student_subject_delete.empty?
         @student_subject_delete.each  do |student_sub|
             student_sub.destroy
            end
          end
           students.each  do |student|
              @student_subject= StudentSubject.new(batch_id: @batch.id,
                              subject_id: @subject.id,student_id: student)
              @student_subject.save
            end
      else
         @student_subject_delete.each  do |student_sub|
             student_sub.destroy
            end
      end
       flash[:notice_ele] = "Elective subject #{@subject.name} assigned to students successfully"
        redirect_to students_elective_path(@subject)
  end

  def email
    @student=Student.find(params[:format])
  end

  def send_email
    @student=Student.find(params[:student_id])
    subject=params[:subject]
    recipient=params[:email][:recipient]
    message=params[:message]
    if recipient.eql? "Student"
      @user=User.find_by_student_id_and_role("#{@student.id}","Student")
    else
      @user=User.find_by_student_id_and_role("#{@student.id}","Parent")
    end
    UserMailer.student_email(@user,subject,message).deliver
    redirect_to students_email_path(@student)
  end

   def report_email
    @student=ArchivedStudent.find(params[:format])
  end

  def send_report_email
    @student=ArchivedStudent.find(params[:student_id])
    subject=params[:subject]
    recipient=params[:email][:recipient]
    message=params[:message]
    if recipient.eql? "Student"
      @user=User.find_by_student_id_and_role("#{@student.student_id}","Student")
    else
      @user=User.find_by_student_id_and_role("#{@student.student_id}","Parent")
    end
    UserMailer.student_email(@user,subject,message).deliver
    redirect_to students_report_email_path(@student)
  end

  def generate_tc
    @student=ArchivedStudent.find(params[:id])
    @immediate_contact=Guardian.find(@student.immediate_contact)
    @father = Guardian.find_by_student_id_and_relation(@student.id,'father')
    @mother = Guardian.find_by_student_id_and_relation(@student.id,'mother')
    @general_setting=GeneralSetting.first
    render 'generate_tc',layout:false
  end

  def remove
    @student=Student.find(params[:format])
  end
  
  def delete
    @student=Student.find(params[:format])
  end

  def destroy
    @student=Student.find(params[:id])
    @student.destroy
    redirect_to home_dashboard_path
    
  end

  def change_to_former
    @student=Student.find(params[:format])
    @archived_student=ArchivedStudent.new

  end

  def archived_student_create
    @student=Student.find(params[:format])
    @archived_student=@student.archived_student
    @archived_student.update(status_description: params[:archived_student][:status_description])
    @student.destroy
    redirect_to students_archived_profile_path(@archived_student)
  end

  def dispguardian
     @student = Student.find(params[:format])
     @guards =@student.guardians.all
  end

  def addguardian
       @student=Student.find(params[:format])
       @guard=@student.guardians.build
  end
  
  def archived_student_guardian
     @student = ArchivedStudent.find(params[:format])
     @guards=Guardian.where(:student_id=>@student.student_id)
  end

  private
  def student_params
      params.require(:student).permit!
  end

  def previous_data_params
    params.require(:student_previous_data).permit!
  end

  def params_subject
    params.require(:student_previous_subject_mark).permit!
  end
end
