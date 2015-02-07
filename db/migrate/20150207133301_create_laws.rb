class CreateLaws < ActiveRecord::Migration
  def change
    create_table :laws do |t|
      t.string :number
      t.string :article
      t.string :description
    end
  end
end
