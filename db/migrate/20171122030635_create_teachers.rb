class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.belongs_to :department, index: true
      t.integer :code
      t.string :name
      t.string :surnames
      t.boolean :contract
      t.boolean :status, :default => false
      t.timestamps
    end
  end
end
