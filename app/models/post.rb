class Post < ApplicationRecord
    # Constants
    enum status: { draft: 0, published: 1 }

    # Associations
    has_one_attached :image
    belongs_to :user
    has_many :comments, -> { where(comment_id: nil) }, dependent: :destroy

    # Scope func
    scope :published_or_owned_by, ->(user) { published.or(where(user: user)).includes(:user, :image_attachment) }

    # class methods
    def self.ransackable_attributes(auth_object = nil)
        [ "content", "title" ]
    end
    def self.ransackable_associations(auth_object = nil)
        [ "image_attachment", "image_blob", "user" ]
    end

    # Validates func
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 10 }
end
