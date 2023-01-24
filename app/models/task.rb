# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  body       :text
#  status     :string           default("notstarted")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :bigint           not null
#
# Indexes
#
#  index_tasks_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#
class Task < ApplicationRecord
  belongs_to :owner, class_name: "User"
  enum status: { notstarted: "notstarted", pending: "pending", complete: "complete" }
  scope :notstarted, -> { where(status: "notstarted") }
  scope :pending, -> { where(status: "pending") }
  scope :complete, -> { where(status: "complete") }
  validates :body, presence: true
end
