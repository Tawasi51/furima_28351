# frozen_string_literal: true

class DeviseCreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,           null: false
      t.text    :text,           null: false
      t.integer :product_state,  null: false
      t.integer :delivery,       null: false
      t.integer :prefecture,     null: false
      t.integer :days,           null: false
      t.integer :price,          null: false
      t.integer :due,            null: false
      t.integer :revenue,        null: false
      t.references :user,        null: false,foreign_key: true
      t.timestamps
    end  
  end
end
