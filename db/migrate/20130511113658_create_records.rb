class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :type
      t.float :value
      t.string :time

      t.timestamps
    end
  end
end
