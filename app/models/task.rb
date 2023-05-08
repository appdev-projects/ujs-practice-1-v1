class Task < ApplicationRecord

  belongs_to :user

  validates :content, presence: true

  enum status: {
    not_started: "not_started",
    in_progress: "in_progress",
    completed: "completed"
  }
end
