class Product < ApplicationRecord
  belongs_to :store, optional: true
  has_many :order_details
  has_many :orders, through: :order_details

  searchkick

  scope :search_import, -> {includes(:orders)}

  def search_data
    attributes.merge order_ids: order_ids
  end
end
