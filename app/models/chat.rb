class Chat < ApplicationRecord
  belongs_to :user
  has_many :message, dependent: :destroy
  validates :id_user, presence: true
end
