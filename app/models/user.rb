class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
  has_many :tasks
  has_many :diaries
  mount_uploader :image, ImageUploader

  validates :nickname, presence: true, length: { in: 2..10 }
  validates :email, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 8 }
  validates :prefecture_id, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
