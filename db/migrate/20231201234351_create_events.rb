class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.integer :event_id, :null => false
      t.integer :dancer_id, :null => false
      t.integer :admin_id, :null => false

      t.timestamps
    end
  end
end
