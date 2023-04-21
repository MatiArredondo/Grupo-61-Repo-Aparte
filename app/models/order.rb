class Order < ApplicationRecord
    belongs_to :user, foreign_key: 'id_user'
    belongs_to :product
    validates :id_product, presence: true
    validates :id_user, presence: true
"""
colocar validate
"""
end
