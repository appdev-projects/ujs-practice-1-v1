# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :user

  validates :content, presence: true

  enum status: {
    not_yet_started: "not_yet_started",
    in_progress: "in_progress",
    completed: "completed"
  }
end
