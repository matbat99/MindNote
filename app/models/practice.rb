class Practice < ApplicationRecord
  belongs_to :user
  has_many :sessions
  belongs_to :song
  validates :song, uniqueness: { scope: :user_id, message: "You have already added this song" }

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

  def self.urgent_songs(user_id)
    user = User.find(user_id)
    practices = user.practices

    return practices = [] if practices.empty?

    practices = practices.select { |practice| practice.active? }
    practices = practices.select { |practice| practice.need_to_practice?}
    practices = practices.each { |practice| practice.update_importance }
    practices.sort_by { |practice| practice.importance }
    practices.reverse
  end

  def update_importance
    today = DateTime.now.to_i
    last_session = self.sessions.order(:created_at).last.created_at
    last_session += self.interval.days
    importance = (today - last_session.to_i)
    self.update(importance: importance)
  end

  def need_to_practice?
    last_session = self.sessions.order(:created_at).last.created_at
    last_session += self.interval.days
    last_session.past?
  end

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
