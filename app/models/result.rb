class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  validates :score,
    numericality: { :greater_than_or_equal_to => 0 }
  validates :student, uniqueness: { scope: :exam }
  validates :exam, uniqueness: { scope: :student }

  def approved?
    score.try(:>=, exam.minimum)
  end

end
