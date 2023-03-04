# frozen_string_literal: true

class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.references :user, references: :users, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.integer :amount
      t.timestamps
    end
  end
end
