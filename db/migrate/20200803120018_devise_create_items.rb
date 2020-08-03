# frozen_string_literal: true

class DeviseCreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :item_name,   null: false
      t.string  :item_text,   null: false
      t.integer :item_price,  null: false  
  end
end
