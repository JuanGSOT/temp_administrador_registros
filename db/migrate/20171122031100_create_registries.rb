class CreateRegistries < ActiveRecord::Migration[5.1]
  def change
    create_table :registries do |t|
      t.belongs_to :article, index: true
      t.belongs_to :user, index: true
      t.belongs_to :teacher, index: true
      t.belongs_to :classroom, index: true
      t.boolean    :status
      t.timestamps
    end
  end
end
