class CreateClassrooms < ActiveRecord::Migration[5.1]
  def change
    create_table :classrooms do |t|
      t.string :name
      t.boolean :status, :defautl => false
      t.timestamps
    end
  end
end
