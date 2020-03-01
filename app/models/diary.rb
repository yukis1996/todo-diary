class Diary < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 15 }
  validates :impression, presence: true, length: { maximum: 150 }

  enum status:{nonreleased: 0, released: 1}
end
