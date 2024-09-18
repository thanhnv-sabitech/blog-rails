class Post < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 10 }
    belongs_to :user
    enum status: { draft: 0, published: 1}
end
