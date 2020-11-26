class RemovePolicySubject < ActiveRecord::Migration[6.0]
  def change
    remove_reference :policies, :subject, :polymorphic => true
  end
end
