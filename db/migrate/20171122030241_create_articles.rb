class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :details
      t.text :description
      t.integer :service, :default => 0
      t.datetime :maintenance
      t.boolean :status, :default => false
      t.boolean :live, :default => true
      t.timestamps
    end
  end
end
