# == Schema Information
#
# Table name: follow_requests
#
#  id           :bigint           not null, primary key
#  recipient_id :bigint           not null
#  sender_id    :bigint           not null
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class FollowRequest < ApplicationRecord
  belongs_to :recipient, class_name: "User"
  belongs_to :sender, class_name: "User"

  enum status: { pending: "pending", rejected: "rejected", accepted: "accepted" }

  scope :accepted, -> { where(status: "accepted" ) }
  scope :not_accepted, -> { where.not(status: "accepted" ) }

  validates :user_id, uniqueness: { scope: :sender_id, message: "has already sent a follow request" }

  validates :user_id, uniqueness: { scope: :recipient_id, message: "has already received a follow request" }
end
