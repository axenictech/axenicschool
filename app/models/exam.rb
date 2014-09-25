class Exam < ActiveRecord::Base
	belongs_to :exam_group
	belongs_to :subject
	belongs_to :event
	has_many :exam_scores,dependent: :destroy
	 
	validates :start_time, presence:true
	validates :end_time, presence:true
	validates :maximum_marks, presence:true
	validates :minimum_marks, presence:true
	validates :weightage, presence:true	
	
	validate :end_date_cannot_be_less_than_start


	def end_date_cannot_be_less_than_start
		if  end_time.present? and end_time < start_time then
			error.add(:end_time, "cannot be less than start time");
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
