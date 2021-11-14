class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :produto
      t.string :endereco
      t.string :saida
      t.string :entrada
      t.string :entregador

      t.timestamps
    end
  end
end
