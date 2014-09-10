class Guardian < ActiveRecord::Base
	belongs_to :country
    belongs_to :student

    validates :first_name, presence: true ,format: { with: /\A[a-zA-Z]+\z/,message: "only allows letters" }
	validates_length_of :first_name,:minimum => 1,:maximum =>20
    
    validates :last_name, presence: true, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
    validates_length_of :last_name,:minimum => 1,:maximum =>20
  
    validates :relation, presence: true, format: { with: /\A[a-z A-Z]+\z/,message: "only allows letters" }
    validates_length_of :relation,:minimum => 1,:maximum =>20

end
