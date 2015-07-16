class CreateAcceptedChallenges < ActiveRecord::Migration
  def change
    create_table :accepted_challenges do |t|
      t.integer :challenge_id
      t.integer :user_id
      t.boolean :is_accomplished, default: false
      t.text :remark
      t.timestamps
    end
  end
end
