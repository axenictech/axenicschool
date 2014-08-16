class GeneralSetting < ActiveRecord::Base

	validates :institution_name, presence: true,
								length: { minimum: 4, maximum: 15 }
	validates :institution_name, format: { with: /\A[a-zA-Z]+\z/,
    message: "only allows letters" }
	validates :institution_address, presence: true,
								length: { minimum: 4, maximum: 50 }

	validates :institution_phone_no, presence: true, numericality: true

end
