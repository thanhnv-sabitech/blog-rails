class Post < ApplicationRecord
    # Constants
    enum status: { draft: 0, published: 1 }

    # Associations
    has_one_attached :image
    belongs_to :user

    # Scope func
    scope :published_or_owned_by, ->(user) { published.or(where(user: user)) }

    # Validates func
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 10 }
end
