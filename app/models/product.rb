class Product < ApplicationRecord
    has_many :review, dependent: :destroy
    has_one :order
    has_one :user, through: :order
    validates :name, presence: true
    validates :price, presence: true

  end
