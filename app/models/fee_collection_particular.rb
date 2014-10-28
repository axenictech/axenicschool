class FeeCollectionParticular < ActiveRecord::Base
	belongs_to :finance_fee_collection
	belongs_to :student
	belongs_to :category
end
