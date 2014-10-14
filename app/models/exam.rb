class Exam < ActiveRecord::Base
	belongs_to :exam_group
	belongs_to :subject
	belongs_to :event
	has_many :exam_scores,dependent: :destroy
	
	validates :maximum_marks,numericality: { only_integer: true },
              length:{minimum:1,maximum:3},allow_blank: true

	validates :minimum_marks,numericality: { only_integer: true },
              length:{minimum:1,maximum:3},allow_blank: true

	validate :end_time_cannot_be_less_than_start_time
	validate :start_time_cannot_be_less_than_past
	validate :end_time_cannot_be_less_than_past
	validate :max_marks_greater_than_min_marks

	def end_time_cannot_be_less_than_start_time

		if  end_time.present? and end_time < start_time 
			errors.add(:end_time, "cannot be less than start time");
		end	
	end

	def start_time_cannot_be_less_than_past
		if start_time.present? and start_time.to_date < Date.today
			errors.add(:start_time, "should not be past date");
		end
	end

	def end_time_cannot_be_less_than_past
		if end_time.present? and end_time.to_date < Date.today
			errors.add(:end_time, "should not be past date");
		end
	end

	def max_marks_greater_than_min_marks
		if maximum_marks.present? and minimum_marks.present? and maximum_marks < minimum_marks
			errors.add(:maximum_marks,"should be greater than minimum marks");
		end
	end
	def create_exam_event
		
		batch=self.exam_group.batch
		@event=self.event
		if @event.nil?
			event=Event.create(title:"Exam",description:"#{self.exam_group.name} for subject- #{self.subject.name} #{batch.course.course_name} #{batch.course.section_name} #{batch.name}",
				start_date:self.start_time,
				end_date:self.end_time,
				is_exam:true)
			self.update(event_id:event.id)
		else
			@event.update(start_date:self.start_time,end_date:self.end_time)
		end
	end 
end
