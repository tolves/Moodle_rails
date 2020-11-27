class Admin::PoliciesController < ApplicationController

  def index
    @policies = Policy.last
  end

  def new
    @policy = Policy.new
    @policy_items = @policy.build_policy_item
    @classes = ApplicationController.subclasses
  end

  def create
    @policy = Policy.new params_policy
    @policy_items = @policy.build_policy_item params_policy_item
    flash.notice = if @policy.save
                     'Add Policy Successful'
                   else
                     @policy.errors
                   end
    redirect_to admin_policies_path
  end

  private

  def params_policy
    attrs = %i[name subject_type subject_id object_type object_id]
    params.require(:policy).permit(attrs)
  end

  def params_policy_item
    attrs = %i[view new edit remove]
    params.require(:policy).require(:policy_item).permit(attrs)
  end
end
