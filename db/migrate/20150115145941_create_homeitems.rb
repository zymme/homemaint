class CreateHomeitems < ActiveRecord::Migration
  def change
    create_table :homeitems do |t|
      t.string :name
      t.string :status
      t.datetime :stagetime
      t.string :userid
      t.text :desc

      t.timestamps
    end
  end
end
