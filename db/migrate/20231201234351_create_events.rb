class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string      :title, :null => false
      t.string      :area
      t.string      :context
      t.integer     :status, :null => false
      t.boolean     :release_flag, :null => false
      t.integer     :event_id
      t.references  :dancer, null: false
      t.references  :admin, null: false
      t.timestamps
    end
  end
end
