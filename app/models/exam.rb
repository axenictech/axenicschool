class Exam < ActiveRecord::Base
  belongs_to :exam_group
  belongs_to :subject
  belongs_to :event
  has_many :exam_scores, dependent: :destroy

  validates :maximum_marks, numericality: { only_integer: true },
                            length: { minimum: 1, maximum: 3 }, allow_blank: true

  validates :minimum_marks, numericality: { only_integer: true },
                            length: { minimum: 1, maximum: 3 }, allow_blank: true

  validate :end_time_cannot_be_less_than_start_time
  validate :start_time_cannot_be_less_than_past
  validate :end_time_cannot_be_less_than_past
  validate :max_marks_greater_than_min_marks
  scope :shod, ->(id) { where(id: id).take }
  def end_time_cannot_be_less_than_start_time
    if  end_time.present? && end_time < start_time
      errors.add(:end_time, 'cannot be less than start time')
    end
  end

  def start_time_cannot_be_less_than_past
    if start_time.present? && start_time.to_date < Date.today
      errors.add(:start_time, 'should not be past date')
    end
  end

  def end_time_cannot_be_less_than_past
    if end_time.present? && end_time.to_date < Date.today
      errors.add(:end_time, 'should not be past date')
    end
  end

  def max_marks_greater_than_min_marks
    if maximum_marks.present? && minimum_marks.present? && maximum_marks < minimum_marks
      errors.add(:maximum_marks, 'should be greater than minimum marks')
    end
  end

  def create_exam_event
    batch = exam_group.batch
    @event = event
    if @event.nil?
      event = Event.create(title: 'Exam', description: "#{exam_group.name} for subject- #{subject.name} #{batch.course.course_name} #{batch.course.section_name} #{batch.name}",
                           start_date: start_time,
                           end_date: end_time,
                           is_exam: true)
      update(event_id: event.id)
    else
      @event.update(start_date: start_time, end_date: end_time)
    end
  end

  def select_subject(s1,s2,exam)
    unless s2.nil?
      s2.each do |std|
        unless exam.subject.elective_group.nil?
          is_elective = StudentSubject.find_by_student_id_and_subject_id(std.id, exam.subject_id)
          unless is_elective.nil?
            s1 << std
          end
        else
          s1 << std
        end
      end
    end
    s1
  end

  def score_exam(temps,batch,exam,exam_group,grades)
    temps.each_pair do |student_id, details|
      @exam_score = ExamScore.find_by_exam_id_and_student_id(exam.id, student_id)
      @grouped_exam = GroupedExamReport.find_by_batch_id_and_student_id_and_exam_group_id_and_subject_id(batch.id, student_id, exam_group.id, exam.subject_id)
      score_grade = ''
      fail = false
      fail = true if details[:marks].to_f < exam.minimum_marks.to_f

      unless exam.exam_group.exam_type == 'Marks'
        unless exam.exam_group.exam_type == 'Grades'
          percentage = (details[:marks].to_f * 100) / exam.maximum_marks.to_f
          grades.each do |grade|
            if percentage >= grade.min_score
              score_grade = grade.id
            end
          end
        else
          grades.each do |grade|
            if details[:marks].to_f >= grade.min_score
              score_grade = grade.id
            end
          end
        end
      end

      if @exam_score.nil?
        exam_score = ExamScore.new(exam_id: exam.id, student_id: student_id,
                                   marks: details[:marks], remarks: details[:remarks], grading_level_id: score_grade, is_failed: fail)
        unless exam_score.save
          @errors = exam_score.errors.full_messages
        end
      else
        unless @exam_score.update(marks: details[:marks], remarks: details[:remarks], grading_level_id: score_grade, is_failed: fail)
          @errors = @exam_score.errors.full_messages
        end
      end

      if @errors.nil?
        if @grouped_exam.nil?
          GroupedExamReport.create(batch_id: batch.id, student_id: student_id,
                                   exam_group_id: exam_group.id, subject_id: exam.subject_id, marks: details[:marks])
        else
          @grouped_exam.update(marks: details[:marks])
        end
      end
    end
  end
end
