class FixColumnName < ActiveRecord::Migration

  	def self.up
  	  rename_column :records, :type, :comment
    end

  def down
  end
end
