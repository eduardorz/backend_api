class CreateGymClasses < ActiveRecord::Migration[8.0]
  def change
    create_table :gym_classes do |t|
      t.string :name
      t.text :description
      t.string :instructor
      t.datetime :schedule

      t.timestamps
    end
  end
end
