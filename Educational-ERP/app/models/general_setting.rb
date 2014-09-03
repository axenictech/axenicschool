class GeneralSetting < ActiveRecord::Base

	validates :InstitutionName, presence: true,
								length: { minimum: 4, maximum: 15 }
	validates :InstitutionName, format: { with: /\A[a-z A-Z]+\z/,
    message: "only allows letters" }
	validates :InstitutionAddress, presence: true,
								length: { minimum: 4, maximum: 50 }

	validates :InstitutionPhoneNo, presence: true, numericality: true

	has_attached_file :image, :styles =>{:medium=>"300*300", :thumb=>"100*100"} 
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end
