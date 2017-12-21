class Student < ApplicationRecord
  has_many :results
  belongs_to :course

  validates_presence_of :first_name, :last_name, :dni, :number, :email

  validates :dni,
    length: { in: 6..11 },
    numericality: { only_integer: true }

   validates_email_format_of :email

  def to_s
    "#{last_name}, #{first_name}"
  end

  def score_for(exam)
    results.where(exam_id: exam.id).take.try(:score)
  end

  def attended_to?(exam)
    self.score_for(exam).present?
  end

  def passed?(exam)
    self.score_for(exam) >= exam.minimum
  end

end
