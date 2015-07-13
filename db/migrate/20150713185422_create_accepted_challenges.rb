class CreateAcceptedChallenges < ActiveRecord::Migration
  def change
    create_table :accepted_challenges do |t|
      t.integer :challenge_id
      t.boolean :is_accomplished, default: false
      t.text :remark
      t.string :proof_1_url
      t.string :proof_2_url
      t.string :proof_3_url
      t.timestamps
    end
  end
end
