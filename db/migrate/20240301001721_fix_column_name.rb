class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :post, :statustring, :status
  end
end
