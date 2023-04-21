class Review < ApplicationRecord
    belongs_to :user, foreign_key: 'id_user'
    belongs_to :product, foreign_key: 'id_product'
    validates :id_user, presence: true
    validates :id_product, presence: true
    validates :content, presence: true
    validates :grade, presence: true

end
