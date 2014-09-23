class Exam < ActiveRecord::Base
	belongs_to :exam_group
	belongs_to :subject
	has_many :exam_scores
	# after_publish_exam :create_exam_event 

	def self.create_exam_event
		
			batch=self.exam_group.batch
			@event=Event.find(origin_id:self.id)
			if @event.nil?
				Event.create(title:"Exam",description:"#{self.exam_group.name} for #{batch.course.course_name - 
					batch.course.section_name - batch.name} subject- #{self.subject.name}",
					start_date:self.start_time,
					end_date:self.end_time,
					is_exam:true,
					origin_id:self.id,
					origin_type:"Examination")
			else
			@event.update(start_date:self.start_time,end_date:self.end_time)
			end

	end 
end
