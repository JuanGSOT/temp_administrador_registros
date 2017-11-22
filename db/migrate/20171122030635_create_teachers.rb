class CreateTeachers < ActiveRecord::Migration[5.1]
  def change
    create_table :teachers do |t|
      t.integer :code
      t.string :name
      t.string :surnames
      t.boolean :contract
      t.boolean :status

      t.timestamps
    end
  end
end
