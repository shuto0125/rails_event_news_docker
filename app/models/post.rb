class Post < ApplicationRecord
  belongs_to :user, optional: true # 退会した時用に
  belongs_to :event

  validates :title, length: { maximum: 100 }, presence: true
  validates :content, presence: true

  def created_by?(user)
    return false unless user
    owner_id ==user.id
  end

end
