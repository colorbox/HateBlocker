class AddActivationStatusToProhibition < ActiveRecord::Migration[5.2]
  def change
    add_column :prohibitions, :activated, :boolean, default: true, null: false
  end
end
