class Diary < ApplicationRecord
  belongs_to :user

  enum status:{nonreleased: 0, released: 1}
end
