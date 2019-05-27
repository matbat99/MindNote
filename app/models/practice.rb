class Practice < ApplicationRecord
  belongs_to :user
  has_many :sessions
  belongs_to :song

  MAX_GRADE = 5
  # D_EF[q] = (0.1 - (MAX_GRADE - grade) * (0.08 + (MAX_GRADE - grade) * 0.02))
  D_EF = {
    5 => 0.1,
    4 =>  0,
    3 => -0.14,
    2 => -0.32,
    1 => -0.54,
    0 => -0.8
  }.freeze


  def next_interval(grade)
    grade = MAX_GRADE if grade > MAX_GRADE

    if grade >= 3
      if self.repetition == 0
        self.interval = 1
        self.repetition = 1
      elsif self.repetition == 1
        self.interval = 6
        self.repetition = 2
      else
        self.interval = (self.interval * self.easiness_factor).round
        self.repetition = self.repetition + 1
      end
    else
      self.repetition = 0
      self.interval = 1
    end

    self.easiness_factor = (self.easiness_factor + D_EF[grade]).round(2)
    puts self.easiness_factor
    self.easiness_factor = self.easiness_factor < 1.3 ? 1.3 : self.easiness_factor
  end
end
