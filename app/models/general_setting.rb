class GeneralSetting < ActiveRecord::Base

	validates :InstitutionName, presence: true,format:{ with: /\A[a-zA-Z " "]+\z/},
								length: { :in => 1..100 },on: :update
	validates :InstitutionAddress, presence: true,
								length: { :in => 1..100 },on: :update
	validates :InstitutionPhoneNo, presence: true, length: { :in => 10..10 },
								numericality:{only_integer: true},on: :update

	has_attached_file :image, :styles =>{:medium=>"300*300", :thumb=>"100*100"}
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]


end
