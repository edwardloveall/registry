class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :link
      t.float :price
      t.attachment :image

      t.timestamps
    end
  end
end
