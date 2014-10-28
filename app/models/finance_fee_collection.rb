class FinanceFeeCollection < ActiveRecord::Base
	belongs_to :batch
	belongs_to :finance_fee_category
	has_many :fee_collection_particulars

	def create_collection_particular(batch,master_category)
		fee_particulars=master_category.finance_fee_particulars.all
		unless fee_particulars.nil?
			fee_particulars.each do |p|
			if p.student.batch==batch
			   self.fee_collection_particulars.create(name:p.name,description:p.description,amount:p.amount,category_id:p.category_id,admission_no:p.admission_no,student_id:p.student_id)
			end
			end
		end
	end
end
