class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :location
      t.string :date
      t.references :subject, foreign_key: true
      t.integer :tutor_id
      t.integer :student_id

      t.timestamps
    end
  end
end
