# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :nickname,               null: false
      t.string :email,                  null: false             
      # t.string :password,              null: false
      # t.string :password_confirmation, null: false
      t.string :family_name,            null: false
      t.string :given_name,             null: false
      t.string :kana_family_name,       null: false
      t.string :kana_given_name,        null: false
      t.date   :birth_day,             null: false
      t.timestamps

      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
    end
  end
end
