class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :details
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
