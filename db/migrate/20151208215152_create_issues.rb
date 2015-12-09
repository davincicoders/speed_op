class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.references :site
      t.decimal :score
      t.text :suggestion
      t.string :name
      t.string :type
      t.datetime :expired_at

      t.timestamps null: false
    end
  end
end
