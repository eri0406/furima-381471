class Item < ApplicationRecord
	belongs_to :user
	has_one_attached :image

	extend ActiveHash::Associations::ActiveRecordExtensions
	belongs_to :category
	belongs_to :state
	belongs_to :shipping_fee
	belongs_to :prefecture
	belongs_to :reach_date

	validates :name, :description, presence: true

	validates :category_id, :state_id, :shipping_fee_id, :prefecture_id, :reach_date_id, numericality: { other_than: 1 }
end
