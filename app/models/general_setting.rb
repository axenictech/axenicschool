class GeneralSetting < ActiveRecord::Base

	validates :school_or_college_name, presence: true,format:{ with: /\A[a-zA-Z " "]+\z/},
								length: { :in => 1..100 },on: :update
	validates :school_or_college_address, presence: true,
								length: { :in => 1..100 },on: :update
	validates :school_or_college_phone_no, presence: true, length: { :in => 10..10 },
								format:{ with: /\A[0-9]+\z/},on: :update

	has_attached_file :image, :styles =>{:medium=>"300*300", :thumb=>"100*100"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validate  :finance_end_date_cannot_be_less_than_finance_start_date

 def finance_end_date_cannot_be_less_than_finance_start_date
    if finance_end_year_date.present? and finance_end_year_date < finance_start_year_date
      errors.add(:finance_end_year_date, "can't be less than finance start year date")
    end
  end
  
end
