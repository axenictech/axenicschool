# ExamReport Controller
class ExamReportsController < ApplicationController
  def exam_wise_report
    @batches ||= Batch.includes(:course).all
    @exam_groups ||= Batch.first.exam_groups
    @batches ||= Batch.includes(:course).all
    @exam_groups ||= Batch.first.exam_groups
    authorize! :read, @exam_groups.first
  end

  def select
    @course = Course.shod(params[:exam][:course_id])
    @batches ||= @course.batches
    authorize! :read, ExamGroup
  end

  def select_batch
    @batch = Batch.shod(params[:batch_select][:id])
    @exam_groups ||= @batch.exam_groups
    authorize! :read, @exam_groups.first
  end

  def generate_exam_report
    if params[:exam_group_select][:id].present?
      @exam_group = ExamGroup.shod(params[:exam_group_select][:id])
      generate_exam_report2
    else
      generate_exam_report3
    end
    authorize! :read, @exam_group
  end

  def generate_exam_report2
    @batch = @exam_group.batch
    @student = @batch.students.first
  end

  def generate_exam_report3
    flash[:alert] = t('exam_report_error')
    @batches ||= Batch.includes(:course).all
    @exam_groups ||= Batch.first.exam_groups
    render 'exam_wise_report'
  end

  def exam_wise_students_report
    @exam_group = ExamGroup.shod(params[:exam_group_id])
    @batch = @exam_group.batch
    @students ||= @batch.students
    @general_setting = GeneralSetting.first
    render 'exam_wise_students_report', layout: false
  end

  def exam_wise_consolidated_report
    @exam_group = ExamGroup.shod(params[:exam_group_id])
    @batch = @exam_group.batch
    @general_setting = GeneralSetting.first
    render 'exam_wise_consolidated_report', layout: false
  end

  def student_exam_report
    @exam_group = ExamGroup.shod(params[:id])
    @student = Student.shod(params[:format])
    authorize! :read, @exam_group
  end

  def consolidated_report
    @exam_group = ExamGroup.shod(params[:id])
    @batch = @exam_group.batch
    authorize! :read, @exam_group
  end

  def subject_wise_report
    @batches ||= Batch.includes(:course).all
    @subjects ||= Batch.first.subjects
    @batches ||= Batch.includes(:course).all
    @subjects ||= Batch.first.subjects
    authorize! :read, ExamGroup
  end

  def choose_batch
    @batch = Batch.shod(params[:batch_choose][:id])
    @subjects ||= @batch.subjects
    authorize! :read, ExamGroup
  end

  def generate_subject_report
    if params[:subject_select][:id].present?
      @subject = Subject.shod(params[:subject_select][:id])
      generate_subject_report2
    else
      generate_subject_report3
    end
    authorize! :read, @exam_groups.first
  end

  def generate_subject_report2
    @batch = @subject.batch
    @exam_groups ||= @batch.result_published
    @students ||= @batch.students
  end

  def generate_subject_report3
    flash[:alert] = t('subject_report_error')
    @batches ||= Batch.includes(:course).all
    @subjects ||= Batch.first.subjects
    render 'subject_wise_report'
  end

  def subject_wise_students_report
    @subject = Subject.shod(params[:id])
    @batch = @subject.batch
    @exam_groups ||= @batch.result_published
    @students ||= @batch.students
    @general_setting = GeneralSetting.first
    render 'subject_wise_students_report', layout: false
  end

  def grouped_exam_report
    @batches ||= Batch.includes(:course).all
    authorize! :read, ExamGroup
  end

  def generate_grouped_report
    if params[:batch_option][:id].present?
      @batch = Batch.shod(params[:batch_option][:id])
      generate_grouped_report2
    else
      generate_grouped_report3
    end
    authorize! :read, ExamGroup
  end

  def generate_grouped_report2
    @students ||= @batch.students
    @student = @batch.students.first
    @exam_groups ||= @batch.result_published
    @subjects ||= @batch.subjects
  end

  def generate_grouped_report3
    flash[:alert] = t('group_error')
    @batches ||= Batch.includes(:course).all
    render 'grouped_exam_report'
  end

  def grouped_exam_students_report
    @batch = Batch.shod(params[:batch_id])
    @students ||= @batch.students
    @exam_groups ||= @batch.result_published
    @subjects ||= @batch.subjects
    @general_setting = GeneralSetting.first
    render 'grouped_exam_students_report', layout: false
  end

  def student_report
    @batch = Batch.shod(params[:id])
    @exam_groups ||= @batch.result_published
    @student = Student.shod(params[:student_id])
    @subjects ||= @batch.subjects
    authorize! :read, @exam_groups.first
  end

  def archived_student_report
    @courses ||= Course.all
    @batches ||= Course.first.batches
    authorize! :read, ExamGroup
  end

  def select_course
    @course = Course.shod(params[:course_select][:id])
    @batches ||= @course.batches
    authorize! :read, ExamGroup
  end

  def generate_archived_report
    if params[:batch_select][:id].present?
      @batch = Batch.shod(params[:batch_select][:id])
      generate_archived_report2
    else
      generate_archived_report3
    end
    authorize! :read, ExamGroup
  end

  def generate_archived_report2
    @students ||= @batch.archived_students
    @student = @batch.archived_students.first
    @exam_groups ||= @batch.result_published
    @subjects ||= @batch.subjects
  end

  def generate_archived_report3
    flash[:alert] = t('group_error')
    @courses ||= Course.all
    @batches ||= Course.first.batches
    render 'archived_student_report'
  end

  def archived_students_exam_report
    @batch = Batch.shod(params[:id])
    @students ||= @batch.archived_students
    @exam_groups ||= @batch.result_published
    @subjects ||= @batch.subjects
    @general_setting = GeneralSetting.first
    render 'archived_students_exam_report', layout: false
  end

  def archived_student
    @student = ArchivedStudent.shod(params[:id])
    @batch = @student.batch
    @exam_groups ||= @batch.result_published
    @subjects ||= @batch.subjects
    authorize! :read, @exam_groups.first
  end

  def consolidated_archived_report
    @batch = Batch.shod(params[:id])
    @exam_groups ||= @batch.exam_groups
    authorize! :read, @exam_groups.first
  end

  def exam_group_wise_report
    @exam_group = ExamGroup.shod(params[:exam_group_option][:id])
    @batch = @exam_group.batch
    authorize! :read, @exam_group
  end

  def archived_students_consolidated_report
    @batch = Batch.shod(params[:id])
    @exam_groups ||= @batch.result_published
    @general_setting = GeneralSetting.first
    render 'archived_students_consolidated_report', layout: false
  end

  def student_ranking_per_subject
    @batches = Batch.all
    @subjects = Batch.last.subjects.all if Batch.last
    @batches = Batch.all
    @subjects = Batch.last.subjects.all
    authorize! :read, ExamGroup
  end

  def rank_report_batch
    @batch = Batch.find(params[:rank_report][:batch_id])
    @subjects = @batch.subjects.all
    authorize! :read, ExamGroup
  end

  def generate_ranking_report
    if request.get?
      if params[:rank_report][:subject_id].present?
        @subject = Subject.find(params[:rank_report][:subject_id])
        @batch = @subject.batch
        @students = @batch.students.all
        @exam_groups = @batch.exam_groups.where(result_published: true)
      else
        flash[:notice_rank_sub] = 'Please select subject'
        @batches = Batch.includes(:course).all
        @subjects = Batch.last.subjects.all
        render 'student_ranking_per_subject'
      end
    end
    authorize! :read, ExamGroup
  end

  def subject_wise_ranking_report
    @subject = Subject.find(params[:id])
    @batch = @subject.batch
    @students = @batch.students.all
    @exam_groups = @batch.exam_groups.where(result_published: true)
    @general_setting = GeneralSetting.first
    render 'subject_wise_ranking_report', layout: false
  end

  def student_ranking_per_batch
    @batches = Batch.includes(:course).all

    authorize! :read, ExamGroup
  end

  def generate_student_ranking_report
    if request.get?
      if params[:rank_report][:batch_id].present?
        @batch = Batch.find(params[:rank_report][:batch_id])
        @students = @batch.students.all
        @exam_groups = @batch.exam_groups.where(result_published: true)
        @subjects = @batch.subjects.all
      else
        flash[:notice_rank_batch] = 'Please select batch'
        @batches = Batch.includes(:course).all
        render 'student_ranking_per_batch'
        end
     end
    authorize! :read, ExamGroup
  end

  def batch_wise_ranking_report
    @batch = Batch.find(params[:batch_id])
    @students = @batch.students.all
    @exam_groups = @batch.exam_groups.where(result_published: true)
    @subjects = @batch.subjects.all
    @general_setting = GeneralSetting.first
    render 'batch_wise_ranking_report', layout: false
  end

  def student_ranking_per_course
    @courses = Course.all
    authorize! :read, ExamGroup
  end

  def generate_student_ranking_report2
    if request.get?
      if params[:rank_report][:course_id].present?
        @course = Course.find(params[:rank_report][:course_id])
        @batches = @course.batches.all
      else
        flash[:notice_rank_course] = 'Please select course'
        @courses = Course.all
        render 'student_ranking_per_course'
        end
    end
    authorize! :read, ExamGroup
  end

  def course_wise_ranking_report
    @course = Course.find(params[:course_id])
    @batches = @course.batches.all
    @general_setting = GeneralSetting.first
    render 'course_wise_ranking_report', layout: false
  end

  def student_ranking_per_school
    @courses = Course.all
    @students = Student.all
    @exam_groups = ExamGroup.where(result_published: true)
    authorize! :read, @exam_groups.first
  end

  def school_wise_ranking_report
    @courses = Course.all
    @students = Student.all
    @exam_groups = ExamGroup.where(result_published: true)
    @general_setting = GeneralSetting.first
    render 'school_wise_ranking_report', layout: false
  end

  def student_ranking_per_attendance
    @batches = Batch.includes(:course).all

    authorize! :read, ExamGroup
  end

  def generate_student_ranking_report3
    @batches = Batch.includes(:course).all
    if request.get?
      if params[:rank_report][:batch_id].present?
        if params[:rank_report][:start_date].present?
          if params[:rank_report][:end_date].present?
            if params[:rank_report][:start_date].to_date < Date.today
              if params[:rank_report][:end_date].to_date < Date.today
                if params[:rank_report][:start_date].to_date < params[:rank_report][:end_date].to_date
                  @batch = Batch.find(params[:rank_report][:batch_id])
                  @start_date = params[:rank_report][:start_date].to_date
                  @end_date = params[:rank_report][:end_date].to_date
                  @students = @batch.students.all
                  @weekdays = @batch.weekdays.all
                  @batch_events = @batch.batch_events.includes(:event).all
                else
                  flash[:notice_rank_att] = 'End date cannot be less than start date'
                  render 'student_ranking_per_attendance'
                end
              else
                flash[:notice_rank_att] = 'End date cannot be in future'
                render 'student_ranking_per_attendance'
              end
            else
              flash[:notice_rank_att] = 'Start date cannot be in future'
              render 'student_ranking_per_attendance'
            end
          else
            flash[:notice_rank_att] = 'Please select end date'
            render 'student_ranking_per_attendance'
          end
        else
          flash[:notice_rank_att] = 'Please select start date'
          render 'student_ranking_per_attendance'
        end
      else
        flash[:notice_rank_att] = 'Please select course'
        render 'student_ranking_per_attendance'
        end
    end
    authorize! :read, ExamGroup
  end

  def attendance_wise_ranking_report
    @batch = Batch.find(params[:batch_id])
    @start_date = params[:start_date].to_date
    @end_date = params[:end_date].to_date
    @students = @batch.students.all
    @weekdays = @batch.weekdays.all
    @general_setting = GeneralSetting.first
    render 'attendance_wise_ranking_report', layout: false
  end

  def generate_view_transcripts
    if request.get?
      if params[:transcript][:batch_id].present?
        @batch = Batch.find(params[:transcript][:batch_id])
        @students = @batch.students.all
        @exam_groups = @batch.exam_groups.where(result_published: true)
        @student = @batch.students.last
      else
        flash[:notice_tran] = 'Please select batch'
        render 'view_transcripts'
      end
    end
    authorize! :read, @exam_groups.first
  end

  def student_view_transcripts
    @student = Student.find(params[:student_id])
    @batch = @student.batch
    @exam_groups = @batch.exam_groups.where(result_published: true)
    @students = @batch.students.all
    authorize! :read, @exam_groups.first
  end

  def students_transcripts_report
    @batch = Batch.find(params[:batch_id])
    @students = @batch.students.all
    @exam_groups = @batch.exam_groups.where(result_published: true)
    @general_setting = GeneralSetting.first
    render 'students_transcripts_report', layout: false
  end

  def select_mode
    @mode = params[:mode][:wise]
    @courses = Course.all

    @batches = Batch.includes(:course).all

    authorize! :read, ExamGroup
  end

  def select_rank
    if params[:mode1]
      @mode = 'course'
      @course = Course.find(params[:mode1][:id])
      @batch_groups = @course.batch_groups.all
      @ranking_levels = @course.ranking_levels.all
    end
    if params[:mode2]
      @mode = 'batch'
      @batch = Batch.find(params[:mode2][:id])
      @ranking_levels = @batch.course.ranking_levels.all
    end
    authorize! :read, ExamGroup
  end

  def select_rank_mode
    @batch = Batch.find(params[:format])
    @rank = params[:ranking_report][:rank]
    @subjects = @batch.subjects.all
    @ranking_level = RankingLevel.find(params[:ranking_report][:ranking_level_id])
    authorize! :read, ExamGroup
  end

  def generate_ranking_level_report
    @report_type = params[:report_type]
    @ranking_level = RankingLevel.find(params[:ranking_level_id])
    @subject = Subject.find(params[:subject][:id])
    @batch = @subject.batch
    @students = @batch.students.all
    @scores = GroupedExamReport.where(student_id: @students.collect(&:id), batch_id: @batch.id, subject_id: @subject.id)
    @batch_group = BatchGroup.find(params[:mode3][:batch_group_id]) if params[:mode3]
    @ranking_level = RankingLevel.find(params[:mode3][:ranking_level_id]) if params[:mode3]
    @mode = 'course'  if params[:mode3]
    @mode = 'batch'   if params[:mode4]
    authorize! :read, ExamGroup
  end

  def combined_details
    @batch = Batch.find(params[:batch][:id])
    @course = @batch.course
    @class_designations = @course.class_designations.all
    @ranking_levels = @course.ranking_levels.all
    authorize! :read, ExamGroup
  end

  def all
    @batch = Batch.find(params[:format])
    @course = @batch.course
    @class_designations = @course.class_designations.all
    authorize! :read, ExamGroup
  end

  def none
    @batch = Batch.find(params[:format])
    @course = @batch.course
    @class_designations = @course.class_designations.all
    authorize! :read, ExamGroup
  end

  def all1
    @batch = Batch.find(params[:format])
    @course = @batch.course
    @ranking_levels = @course.ranking_levels.all
    authorize! :read, ExamGroup
  end

  def none1
    @batch = Batch.find(params[:format])
    @course = @batch.course
    @ranking_levels = @course.ranking_levels.all
    authorize! :read, ExamGroup
  end

  def generate_combined_report
    @batch = Batch.find(params[:format])
    @students = @batch.students.all
    @class_designations = []
    @ranking_levels = []
    class_designations = params[:class_designations]
    if class_designations.present?
      class_designations.each do |d|
        cd = ClassDesignation.find(d)
        @class_designations << cd
      end
    end
    ranking_levels = params[:ranking_levels]
    if ranking_levels.present?
      ranking_levels.each do |r|
        rl = RankingLevel.find(r)
        @ranking_levels << rl
      end
    end
    authorize! :read, ExamGroup
  end
end
