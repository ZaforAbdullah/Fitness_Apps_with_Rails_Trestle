class Goal < ApplicationRecord
  belongs_to :user

  validates :goal_type, :description, :target_value, :target_date, presence: true
  validate :target_date_cannot_be_in_the_past

  before_save :initialize_progress

  def progress_dates
    progress.keys
  end

  def progress_values
    progress.values
  end

  # JSON Accessors
  # Virtual Attributes for JSON
  def get_progress(date)
    progress[date]
  end

  # JSON Accessors
  # Virtual Attributes for JSON
  def set_progress(date, value)
    self.progress[date] = value
  end

  private

  def initialize_progress
    self.progress ||= {}
  end

  def target_date_cannot_be_in_the_past
    if target_date.present? && target_date < Date.today
      errors.add(:target_date, "can't be in the past")
    end
  end
end

