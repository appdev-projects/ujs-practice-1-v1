class Task < ApplicationRecord

  belongs_to :owner, required: true, class_name: "User", foreign_key: "owner_id", counter_cache: true

  enum status: { pending: "not yet started", wip: "in progress", completed: "completed" }

end
