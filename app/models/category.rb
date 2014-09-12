class Category < ActiveRecord::Base

  has_many :students
  # has_many :fee_category ,:class_name =>"FinanceFeeCategory"

   validates :name,presence:true,length: { :in => 1..20 },
   			format: { with: /\A[a-zA-Z0-9_" "-\/]+\Z/,message:"for student category allows only letter"}
end
