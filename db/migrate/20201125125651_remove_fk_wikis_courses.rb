class RemoveFkWikisCourses < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :wikis, :courses
  end
end
