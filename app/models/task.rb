class Task < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :beforetime
  belongs_to_active_hash :aftertime
end
