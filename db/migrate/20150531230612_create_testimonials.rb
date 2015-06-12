class CreateTestimonials < ActiveRecord::Migration
  def change
    create_table :testimonials do |t|
      t.string :title
      t.string :body
      t.integer :testimonial_authenticate

      t.timestamps null: false
    end
  end
end
