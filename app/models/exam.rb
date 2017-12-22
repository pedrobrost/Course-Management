class Exam < ApplicationRecord
  has_many :results, :dependent => :restrict_with_error
  belongs_to :course

  accepts_nested_attributes_for :results

  validates_presence_of :title, :date, :minimum
  validate :correct_year
  validates :minimum,
    numericality: { :greater_than_or_equal_to => 0 }
    

  def approved
    results.select(&:approved?).size
  end

  def failed
    real_results.size - self.approved
  end

  def absent_students
    course.students.size - real_results.size
  end

  def approved_percentage
    (approved * 100.00) / course.students.size
  end

  private
  def real_results
    results.select {|result| result.score.present? }
  end

  def correct_year
    errors.add(:date, "es anterior a el año del curso") unless (date.present? && date.year >= course.year)
  end

end
