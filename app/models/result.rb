class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  validates_presence_of :score, :student, :exam

  validates :score, numericality: true

  validates :student, uniqueness: { scope: :exam }
  validates :exam, uniqueness: { scope: :student }

  def approved?
    score.try(:>=, exam.minimum)
  end

end
