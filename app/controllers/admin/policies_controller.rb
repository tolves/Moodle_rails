class Admin::PoliciesController < ApplicationController
  def new
    @policy = Policy.new
    @policy_items = @policy.build_policy_item
  end

  def create
    subject = Object.const_get params_policy[:subject_type]
    policy = subject.find(params_policy[:subject_id])
    flash.notice = if policy.policies.create params_policy
                     policy_item = Policy.last
                     if policy_item.create_policy_item origin_params_policy_item
                       'Add Policy Successful'
                     else
                       policy_item.errors
                     end
                   else
                     policy.errors
                   end
    redirect_to send("admin_#{params_policy[:subject_type].downcase}_path", params_policy[:subject_id])
  end


  private

  def params_policy
    attrs = %i[name subject_type subject_id object_type object_id]
    params.require(:policy).permit(attrs)
  end

  def origin_params_policy_item
    attrs = %i[view new edit remove]
    params.require(:policy).require(:policy_item).permit(attrs)
  end

  def params_policy_item
    {
        view: origin_params_policy_item[:policy_item][:view],
        new: origin_params_policy_item[:policy_item][:new],
        edit: origin_params_policy_item[:policy_item][:edit],
        remove: origin_params_policy_item[:policy_item][:remove]
    }
  end
end
