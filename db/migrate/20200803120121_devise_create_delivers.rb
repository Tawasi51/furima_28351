# frozen_string_literal: true

class DeviseCreateDelivers < ActiveRecord::Migration[6.0]
  def change
    create_table :delivers do |t|
      t.integer :card_number,     null: false
      t.integer :exp_month,       null: false
      t.integer :exp＿year,       null: false
      t.integer :cvc,             null: false
      t.timestamps
    end
  end
end
