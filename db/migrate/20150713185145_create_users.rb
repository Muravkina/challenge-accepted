class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest, null: false
      t.string :location
      t.string :gender
      t.date :birth_date
      t.string :img_url, default: 'http://at-cdn-s01.audiotool.com/2014/02/26/documents/fixit_-_challenge_accepted/2/cover256x256-adb5b94f4a6a4017a4933d9c63e696b3.jpg'
      t.string :phone_number
      t.timestamps
    end
  end
end
