class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.integer :user_id
      t.string :channel

      t.timestamps
    end
  end
end
