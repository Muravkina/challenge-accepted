class CreateProofs < ActiveRecord::Migration
  def change
    create_table :proofs do |t|
      t.string :proof_url
      t.integer :accepted_challenge_id
    end
  end
end
