# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  body       :text
#  status     :string           default("new")
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
  enum status: { new: "new", pending: "pending", complete: "complete" }
end
