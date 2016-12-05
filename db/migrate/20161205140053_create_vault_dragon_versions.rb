class CreateVaultDragonVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :vault_dragon_versions do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
