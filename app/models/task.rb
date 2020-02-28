class Task < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :day, presence: true
  validates :aftertime_id, numericality: {greater_than_or_equal_to: :beforetime_id}
  validates :place, length: { maximum: 20 }
  validates :doing, presence: true, length: { maximum: 20 }
  validates :memo, length: { maximum: 20 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :beforetime
  belongs_to_active_hash :aftertime

end
