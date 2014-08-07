class Catgeory < ActiveRecord::Base
	 validates :name,presence:true,format: { with: /\A[a-zA-Z]+\z/,message:"only allows letters"}
	 validates :name, presence: true, length: { minimum: 3 , maximum:15 }
end
