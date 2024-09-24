class Comment < ApplicationRecord
  # Associations
  belongs_to :post
  belongs_to :user
  has_many :subordinates, class_name: "Comment", foreign_key: "comment_id", dependent: :destroy
  belongs_to :comment, class_name: "Comment", optional: true
end
