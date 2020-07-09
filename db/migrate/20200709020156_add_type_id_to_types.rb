class AddTypeIdToTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :types, :type_id, :string
  end
end
