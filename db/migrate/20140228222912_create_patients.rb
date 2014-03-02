class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.integer :number
      t.string :diagnosis
      t.date :date_of_admission

      t.timestamps
    end
  end
end
