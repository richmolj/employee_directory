class CreateLeadWanteds < ActiveRecord::Migration[5.2]
  def change
    create_table :lead_wanteds do |t|
      t.integer :lead_id
      t.integer :asset_type_id

      t.timestamps
    end
  end
end
