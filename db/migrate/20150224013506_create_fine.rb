class CreateFine < ActiveRecord::Migration
  def change
    create_table :fines do |t|
      t.references :infraction, index: true
      t.references :law, index: true

      t.timestamps
    end
  end
end
