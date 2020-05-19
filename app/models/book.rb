class Book < ApplicationRecord
    has_many :volumes, dependent: :destroy
    has_many :chapters, through: :volumes
    has_one :book_settings, dependent: :destroy
end
