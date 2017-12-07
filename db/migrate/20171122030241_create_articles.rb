class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :details
      t.text :description
      t.time :service, :default => 0
      t.datetime :maintenance, :default => 0
      t.boolean :status, :default => false

      t.timestamps
    end
  end
end
