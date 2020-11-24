class GroupHasAndBelongsToManyCourse < ActiveRecord::Migration[6.0]
  def change
    create_table :groups_courses, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :course, index: true
    end
  end
end
