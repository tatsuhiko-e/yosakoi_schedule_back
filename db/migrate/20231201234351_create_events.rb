class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string      :title, :null => false
      t.time        :day, :null => false
      t.string      :area
      t.string      :context
      t.integer     :status, :null => false
      t.boolean     :release_flag, :null => false
      t.references  :dancer, null: false
      t.references  :admin, null: false
      t.timestamps
    end
  end
end
