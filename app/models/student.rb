class Student < ApplicationRecord
  has_many :results
  belongs_to :course

  def to_s
    "#{last_name}, #{first_name}"
  end

end
