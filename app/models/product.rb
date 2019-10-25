class Product < ApplicationRecord
  belongs_to :store

  searchkick
end
