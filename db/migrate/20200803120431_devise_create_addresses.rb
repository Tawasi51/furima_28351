# frozen_string_literal: true

class DeviseCreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :post_code,               null: false
      t.string     :pref,                  null: false
      t.string     :city,                  null: false
      t.string     :street,                null: false
      t.string     :building,default: ""
      t.string     :tel,                    null: false
      t.references :item,                null: false, foreign_key: true
      t.timestamps
    end
  end
end
