class Post < ApplicationRecord
    has_one_attached :image
    validates :title, presence: true
    validates :content, presence: true, length: { minimum: 10 }
    belong_to :user
    enum status: { draff: 0, public: 1 }
end
