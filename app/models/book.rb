class Book < ApplicationRecord
  has_one_attached :profile_image
has_many :favorites, dependent: :destroy
has_many :book_comments, dependent: :destroy

def favorited?(user)
   favorites.where(user_id: user.id).exists?
end

  belongs_to :user, optional: true
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
end
