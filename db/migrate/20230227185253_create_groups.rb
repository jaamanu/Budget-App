# frozen_string_literal: true

class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.references :user, references: :users, null: false, foreign_key: { to_table: :users }
      t.string :name
      t.string :icon
      t.timestamps
    end
  end
end
