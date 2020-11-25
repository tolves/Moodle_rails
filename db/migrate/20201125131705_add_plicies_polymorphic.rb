class AddPliciesPolymorphic < ActiveRecord::Migration[6.0]
  def change
    add_reference :policies, :subject, polymorphic: true, index: true
    add_reference :policies, :object, polymorphic: true, index: true
  end
end
