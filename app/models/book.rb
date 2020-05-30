class Book < ApplicationRecord
    has_many :volumes, dependent: :destroy
    has_many :chapters, through: :volumes
    has_one :book_settings, dependent: :destroy
    belongs_to :user
    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :skills, :interests
end
