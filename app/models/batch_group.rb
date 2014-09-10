class BatchGroup < ActiveRecord::Base
  belongs_to :course
  has_many :group_batches

  validates :name, presence: true,length:{minimum:1, maximum:20}, format:{ with: /\A[a-zA-Z0-9_" "-]+\Z/}
end
