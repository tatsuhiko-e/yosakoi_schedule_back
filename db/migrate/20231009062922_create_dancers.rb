class CreateDancers < ActiveRecord::Migration[7.0]
  def change
    create_table :dancers do |t|
      t.string   :nickname, :null => false
      t.integer  :age
      t.integer  :gender
      t.string   :profile
      t.boolean  :is_active, :null => false, :default => false
      t.string   :registration_code

      t.references :user
      t.references :admin
      t.timestamps
    end
  end
end
