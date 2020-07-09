class Types < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |c|
      c.string :name
      c.boolean :canon
    end
  end
end
