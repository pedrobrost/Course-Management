class Exam < ApplicationRecord
  has_many :results, :dependent => :restrict_with_error
  belongs_to :course

  accepts_nested_attributes_for :results, reject_if: proc { |a| a['score'].blank? }

  validates_presence_of :title, :date, :minimum
  validate :correct_year
  validates :minimum,
    numericality: true

  def approved
    results.select(&:approved?).size
  end

  def failed
    results.size - self.approved
  end

  def absent_students
    course.students.size - results.size
  end

  def approved_percentage
    (approved * 100.00) / course.students.size
  end

  private
  def correct_year
    errors.add(:date, "es anterior a el año del curso") unless date.year >= course.year
  end

end
