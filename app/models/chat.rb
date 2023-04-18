class Chat < ApplicationRecord
  belongs_to :user
  validates :id_user, presence: true
end
