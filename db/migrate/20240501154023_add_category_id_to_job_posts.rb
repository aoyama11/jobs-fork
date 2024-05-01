class AddCategoryIdToJobPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :job_posts, :category_id, :integer
  end
end
