class CreateRota < ActiveRecord::Migration
  def self.up
    create_table :rota do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :rota
  end
end
