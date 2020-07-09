class Users < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |c|
      c.string :name
    end
  end
end
