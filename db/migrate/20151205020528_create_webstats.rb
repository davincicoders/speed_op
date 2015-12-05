class CreateWebstats < ActiveRecord::Migration
  def change
    create_table :webstats do |t|
      t.string :site_id
      t.datetime :pull_date
      t.integer :desktop_score
      t.integer :mobile_score
      t.integer :mobile_usability

      t.timestamps null: false
    end
  end
end
