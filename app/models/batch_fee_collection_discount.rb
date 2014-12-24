class BatchFeeCollectionDiscount < ActiveRecord::Base
	scope :shod, ->(id) { where(id: id).take }
end
