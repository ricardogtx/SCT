class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :points
      t.boolean :answer

      t.timestamps null: false
    end
  end
end
