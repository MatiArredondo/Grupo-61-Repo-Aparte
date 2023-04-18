class Order < ApplicationRecord
    belongs_to :user
    belongs_to :product
    validates :id_product, presence: true
    validates :id_user, presence: true
    validates :description, presence: true
    validates :status, presence: true
    validates :order_date, presence: true
end
