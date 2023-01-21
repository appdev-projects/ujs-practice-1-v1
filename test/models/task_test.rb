# == Schema Information
#
# Table name: tasks
#
#  id           :bigint           not null, primary key
#  tasks        :string
#  tasks_count  :integer
#  task_caption :text
#  owner_id     :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
