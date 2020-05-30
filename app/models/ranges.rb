# frozen_string_literal: true

class Ranges
    include ActiveModel::Validations
    aattr_initialize :range_attrs, [:range_start, :range_end]

    validates :range_start, presence: true, allow_nil: true
    validates :range_end, presence: true, allow_nil: true
    validates_each :range_start, :range_end do |record, attr, value|
      record.errors.add(attr, 'incorrect date') if value.present? && value !~ /^[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])/
    end

    def range
      range_start&.to_date..range_end&.to_date
    end
  end
  