class Exam < ApplicationRecord
  has_many :results
  belongs_to :course

  accepts_nested_attributes_for :results, reject_if: proc { |a| a['score'].blank? }

  validates :title, presence: true
  validates :date, presence: true
  validates :minimum,
    presence: true,
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
    (approved * 100) / course.students.size
  end

end
