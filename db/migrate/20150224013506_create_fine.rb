class CreateFine < ActiveRecord::Migration
  def change
    create_table :fines do |t|
      t.references :notification, index: true
      t.references :law, index: true
      t.decimal :price
      t.datetime :regularization

      t.timestamps
    end
  end
end
