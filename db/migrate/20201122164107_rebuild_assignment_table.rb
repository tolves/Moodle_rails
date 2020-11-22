class RebuildAssignmentTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :assignments, :course_id
    add_reference :assignments, :course, foregien_key: true
  end
end
