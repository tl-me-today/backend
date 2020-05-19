class Volume < ApplicationRecord
    belongs_to :books
    has_many :chapters, dependent: :destroy
end
