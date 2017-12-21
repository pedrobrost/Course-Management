class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :student

  def approved?
    score.try(:>=, exam.minimum)
  end

end
