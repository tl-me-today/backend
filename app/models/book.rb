class Book < ApplicationRecord
    resourcify
    has_many :volumes, dependent: :destroy
    has_many :chapters, through: :volumes
    has_one :book_settings, dependent: :destroy
    belongs_to :user
    acts_as_taggable # Alias for acts_as_taggable_on :tags
    acts_as_taggable_on :tags

    after_create :assign_default_role_to_user

    def assign_default_role
      user.add_role(:admin) if user.roles.blank?
    end
end
