class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname,               null: false
      t.string :email,                  null: false             
      t.integer :password,              null: false
      t.integer :password_confirmation, null: false
      t.string :family_name,            null: false
      t.string :given_name,             null: false
      t.string :kana_family_name,       null: false
      t.string :kana_given_name,        null: false
      t.integer :birth_day,             null: false
      t.timestamps
    end
  end
end
