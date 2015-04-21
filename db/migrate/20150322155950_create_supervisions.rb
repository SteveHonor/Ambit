class CreateSupervisions < ActiveRecord::Migration
  def change
    create_table :supervisions do |t|
      t.references :infraction, index: true
      t.string :observation

      t.timestamps
    end
    add_foreign_key :supervisions, :infractions
  end
end
