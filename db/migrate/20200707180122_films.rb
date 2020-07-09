class Films < ActiveRecord::Migration[5.2]
  def change
    create_table :films do |c|
      c.string :title
      c.boolean :canon
    end
  end
end
