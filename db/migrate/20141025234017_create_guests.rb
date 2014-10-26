class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :rsvp
      t.string :food

      t.timestamps
    end
  end
end
