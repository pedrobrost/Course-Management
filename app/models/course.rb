class Course < ApplicationRecord
  has_many :students
  has_many :exams

  validates :title, :presence => true
  validates :year,
    presence: true,
    numericality: { :only_integer => true },
    inclusion: { in: 1900..Date.today.year }

end
