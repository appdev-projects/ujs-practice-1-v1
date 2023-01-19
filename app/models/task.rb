# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  status     :string           default("not_yet_started"), not null
#  user       :string           not null
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
