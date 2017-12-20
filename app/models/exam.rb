class Exam < ApplicationRecord
  has_many :results
  belongs_to :course

  accepts_nested_attributes_for :results,  reject_if: proc { |attributes| attributes['score'].blank? }

end
