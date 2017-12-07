class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :details
      t.text :description
      t.time :service, 'time with time zone'
      t.datetime :maintenance
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
