class Delivery < ApplicationRecord
    validates :produto, presence: true
    validates :endereco, presence: true
    validates :saida, presence: true
    validates :entrada, presence: true
    validates :entregador, presence: true
end
