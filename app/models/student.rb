class Student < ApplicationRecord
  has_many :results
  belongs_to :course

  def to_s
    "#{last_name}, #{first_name}"
  end

  def score_for(exam)
    results.where(exam_id: exam.id).take.try(:score) || "Absent"
  end

end
