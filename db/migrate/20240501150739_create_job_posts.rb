class CreateJobPosts < ActiveRecord::Migration[7.1]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.string :company
      t.string :url

      t.timestamps
    end
  end
end
