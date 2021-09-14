class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :gender, default: null
      t.datetime :birthday
      t.integer :organization_id

      t.timestamps
    end
  end
end
