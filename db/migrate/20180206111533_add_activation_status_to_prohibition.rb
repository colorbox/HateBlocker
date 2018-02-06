class AddActivationStatusToProhibition < ActiveRecord::Migration[5.2]
  def change
    add_column :prohibitions, :activation_status, :string, null: false
  end
end
