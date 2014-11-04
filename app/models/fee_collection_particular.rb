class FeeCollectionParticular < ActiveRecord::Base
	belongs_to :finance_fee_collection
	belongs_to :category
	belongs_to :batch
	has_and_belongs_to_many :students

	def student_fee_collection
		students=[]
		@batch=self.batch
		if self.admission_no.present?
		   students<<@batch.students.find_by_admission_no(self.admission_no)
		elsif self.category.present?
		   students=@batch.students.where(category_id:self.category.id)
		else
		   students=@batch.students
		end
		if students.present?
			students.each do |s|
				student_fee=FeeCollectionParticularsStudent.new
				student_fee.student_id=s.id
				student_fee.fee_collection_particular_id=self.id
				if student_fee.save
				   student_fee.create_finance_fee(self.finance_fee_collection.id,s.id)
				end
			end
		end   
	end

	def collection_amount
		amount=0
		students=self.students
		if students.present?
			students.each do |s|
				amount+=self.amount
			end
		end
		amount
	end

	def student_name
		if self.admission_no.present?
			student=Student.find_by_admission_no(self.admission_no)
		end
		name=student.first_name+" "+student.last_name
	end
end