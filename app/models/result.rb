class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  validates :student, uniqueness: { scope: :exam }
  validates :exam, uniqueness: { scope: :student }

  def approved?
    score.try(:>=, exam.minimum)
  end

end
