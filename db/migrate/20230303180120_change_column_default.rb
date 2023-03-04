# frozen_string_literal: true

class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :groups, :icon, 'https://seeklogo.com/images/D/dollar-logo-0683682259-seeklogo.com.jpg'
  end
end
