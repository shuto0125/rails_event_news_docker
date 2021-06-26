class Ticket < ApplicationRecord
  belongs_to :user, optional: true #関連先が無くてもバリデーションエラーにならないように
  belongs_to :event

  validates :comment, length: { maximum: 30 }, allow_blank: true
end
