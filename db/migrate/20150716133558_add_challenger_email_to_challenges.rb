class AddChallengerEmailToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :challenger_email, :string
  end
end
