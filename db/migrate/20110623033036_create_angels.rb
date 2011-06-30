class CreateAngels < ActiveRecord::Migration
  def self.up
    create_table :angels do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :angels
  end
end
