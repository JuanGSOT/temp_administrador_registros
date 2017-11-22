class CreateRegistries < ActiveRecord::Migration[5.1]
  def change
    create_table :registries do |t|
      t.belongs_to :article, index: true
      t.datetime :loan
      t.datetime :return
      t.belongs_to :user, index: true
      t.belongs_to :teacher, index: true
      t.belongs_to :classroom, index: true
      t.timestamps
    end
  end
end
