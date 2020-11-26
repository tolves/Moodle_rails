class Admin::PoliciesController < ApplicationController
  before_action :prepare_subject, only: %i[attach attach_create]

  def index
    @policies = Policy.last
  end

  def new
    @policy = Policy.new
    @policy_items = @policy.build_policy_item
    @classes = ApplicationController.subclasses
  end

  def create
    # subject = Object.const_get params_policy[:subject_type]
    # policy = subject.find(params_policy[:subject_id])

    @policy = Policy.new params_policy
    @policy_items = @policy.build_policy_item params_policy_item
    flash.notice = if @policy.save
                     'Add Policy Successful'
                   else
                     @policy.errors
                   end
    redirect_to admin_policies_path


  end

  def attach
    @attach = @subject.type_policies.build
  end

  def attach_create
    @subject.type_policies.create! params_attach
    flash.notice = 'Add Policy Successful'
    redirect_to @path_subject and nil
  rescue StandardError => e
    flash.alert = e
    redirect_to @path_attach
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

  def params_attach
    params.require(:type_policy).permit(:policy_id)
  end

  def prepare_subject
    subject_id = params.keys.select { |p| p.match(/^\w+_id$/) }
    if subject_id && subject_id.size == 1
      subject_id = subject_id[0]
      subject_class = subject_id[0..-4].capitalize
    else
      return false
    end
    @subject_class = Object.const_get subject_class
    @subject_id = params[subject_id]
    @subject = @subject_class.find(@subject_id)
    @path_attach = send("admin_#{subject_class.downcase}_attach_path", @subject)
    @path_subject = send("admin_#{subject_class.downcase}_path", @subject)
  end
end
