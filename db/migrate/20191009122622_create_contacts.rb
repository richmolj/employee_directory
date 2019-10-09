class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.belongs_to :company

      t.timestamps
    end
  end
end
