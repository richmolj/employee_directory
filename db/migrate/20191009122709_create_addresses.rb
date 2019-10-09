class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :street
      t.belongs_to :company

      t.timestamps
    end
  end
end
