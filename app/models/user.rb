class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enum for roles
  enum role: { user: 'user', moderator: 'moderator', admin: 'admin' }

  # Validations
  validates :role, presence: true, inclusion: { in: roles.keys }

  has_one :profile, dependent: :destroy
  has_many :workouts, dependent: :destroy
  has_many :nutrition_logs, dependent: :destroy
  has_many :goals, dependent: :destroy

  # Callbacks
  before_validation :set_default_role, if: :new_record?

  # Methods
  def role?(role)
    self.role == role.to_s
  end

  def analyze_activity
    ActivityAnalysisService.new(self).analyze
  end

  def self.send_reminders
    Rails.logger.info "Sending reminders to all users"
    all.each do |user|
      Rails.logger.info "Enqueuing reminder for user #{user.id}"
      ReminderNotificationJob.perform_later(user)
    end
  end

  private

  def set_default_role
    self.role ||= 'user'
  end
end