class Category < ActiveRecord::Base

  has_many :students, dependent: :destroy
  has_many :fee_category ,:class_name =>"FinanceFeeCategory", dependent: :destroy

   validates :name,presence:true,format: { with: /\A[a-zA-Z]+\z/,message:"only allows letters"}
end
