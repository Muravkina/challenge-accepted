class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.integer :creator_id
      t.integer :challenger_id
      t.string :name, null: false
      t.boolean :is_public, default: false
      t.boolean :is_proof_required, default: false
      t.string :location
      t.string :time_limit
      t.string :sample_url
      t.string :img_url, default: 'http://img06.deviantart.net/3395/i/2014/022/6/6/stardust_texture_ii__by_galaxiesanddust-d739shx.jpg'
      t.text :proof_description
      t.text :description, null:false
      t.timestamps
    end
  end
end
