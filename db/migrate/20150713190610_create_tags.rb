class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.integer :challenge_id
      t.string :name
    end
  end
end
