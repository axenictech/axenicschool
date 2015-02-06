class FinanceFeeCategory < ActiveRecord::Base
  include Activity
  has_and_belongs_to_many :batches
  has_many :finance_fee_particulars
  has_many :fee_discounts
  has_many :finance_fee_collections
  validates :name, presence: true, length: \
  { minimum: 1, maximum: 30 }, format: { with: /\A[a-z A-Z 0-9_.-\/]+\z/ }
  validates :description, presence: true, length: { minimum: 1, maximum: 50 }
  scope :shod, ->(id) { where(id: id).take }

  def fee_category(batches)
    return unless batches.present?
    batches.each do |b|
      BatchesFinanceFeeCategory.create(batch_id: b, finance_fee_category_id: id)
    end
  end

  def particulars(batch_id)
    finance_fee_particulars.where(batch_id: batch_id)
  end

  def discounts(batch_id)
    fee_discounts.where(batch_id: batch_id)
  end
end
