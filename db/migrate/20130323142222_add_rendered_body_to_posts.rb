class AddRenderedBodyToPosts < ActiveRecord::Migration
  def up
    add_column :posts, :rendered_body, :text
  end

  def down
    remove_column :posts, :rendered_body
  end
end
