class FeeCollectionDiscountsStudent < ActiveRecord::Base
	belongs_to :student
	belongs_to :fee_collection_discount
end
