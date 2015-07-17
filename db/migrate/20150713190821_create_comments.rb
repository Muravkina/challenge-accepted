class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :challenge_id
      t.integer :accepted_challenge_id
      t.text :body
      t.references :commentable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
