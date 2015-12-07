class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :location
      t.string :image_url
      t.string :url
      # provider and uid cannot be null and should be indexed
      t.string :provider, null: false
      t.string :uid, null: false
      t.timestamps null: false
    end
    # adds a clustered index on those two fields
    # and makes sure that their combination is unique.
    add_index :users, :provider
    add_index :users, :uid
    add_index :users, [:provider, :uid], unique: true
  end
end




