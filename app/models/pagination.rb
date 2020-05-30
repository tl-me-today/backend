# frozen_string_literal: true

class Pagination
    include ActiveModel::Validations
    aattr_initialize %i[current_page current_page_size]
  
    validates :current_page, allow_nil: true, numericality: { only_integer: true }
    validates :current_page_size, allow_nil: true, numericality: { only_integer: true, less_than_or_equal_to: 100, greater_or_equal: 1 }
  
    def page
      current_page&.to_i || 1
    end
  
    def page_size
      current_page_size&.to_i || 10
    end
  
    def offset_size
      (page - 1) * page_size
    end
  end
  