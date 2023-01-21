# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  content        :string
#  tasks_count  :integer
#  task_caption :text
#  owner_id     :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :user
end
