class BankField < ActiveRecord::Base
	validates :name, presence: true,
								length: { minimum: 1, maximum: 50 }, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }

end
