class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :full
      t.string :short
      t.integer :count

      t.timestamps
    end
  end
end
