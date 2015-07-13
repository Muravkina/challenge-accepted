class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.integer :accomplished_chellenge_id
      t.text :comment
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
