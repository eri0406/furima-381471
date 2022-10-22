class Purchase < ApplicationRecord
	belongs_to :item
	has_one :Address
	belongs_to :user
end
