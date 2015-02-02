class RemoveRelationToMembers < ActiveRecord::Migration
  def change
    remove_table :members do |t|
      t.references :user, index: true
      t.references :question, index: true

      t.timestamps null: false
    end
    add_foreign_key :members, :users
    add_foreign_key :members, :questions
  end
end