class Course < ApplicationRecord
  has_many :students, :dependent => :restrict_with_error
  has_many :exams, :dependent => :restrict_with_error

  validates :year,
    presence: true,
    numericality: { :only_integer => true },
    length: { is: 4 },
    inclusion: { in: 1900..(Date.today + 10.years).year }

  def has_students?
    students.any?
  end

end
