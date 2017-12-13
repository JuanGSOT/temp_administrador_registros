class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.boolean :status, :default => false
      t.boolean :live, :default => true
      t.timestamps
    end
  end
end
