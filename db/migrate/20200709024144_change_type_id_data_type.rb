class ChangeTypeIdDataType < ActiveRecord::Migration[5.2]
  #for people table
  def change
    change_column :people, :type_id, :string
  end
end
