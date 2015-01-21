class Company < ActiveRecord::Base
	validates :name, presence: true, length: { \
    minimum: 1, maximum: 20 }, format: { with: /\A[a-zA-Z0-9" "-]+\Z/ }
    validates :criteria, presence: true, length: { minimum: 1, maximum: 9000 }
end
