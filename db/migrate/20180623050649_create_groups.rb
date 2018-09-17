class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups, id: :integer do |t|
      t.string :name

      t.timestamps
    end
  end
end
