class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :course
      t.text :content
      t.references :user, foreign_key: true
      t.string :year
      t.string :semester
      t.string :professor

      t.timestamps
    end
    # will later retreive reviews associated with given user id in 
    # reverse order of creation
    add_index :reviews, [:user_id, :created_at]
  end
end
