class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :name
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end
