class Admin::TypePoliciesController < ApplicationController
  before_action :prepare_subject, only: %i[new create destroy]

  def new
    @attach = @subject.type_policies.build
  end

  def create
    @subject.type_policies.create! params_attach
    flash.notice = 'Add Policy Successful'
    redirect_to @path_subject and nil
  rescue StandardError => e
    flash.alert = e
    redirect_to @path_attach_new
  end

  def destroy
    type_policy = @subject.type_policies.find(params[:id])
    @subject.type_policies.delete type_policy
    flash.notice = 'Remove Policy Successful'
    redirect_to @path_subject
  rescue StandardError => e
    flash.alert = e
    # redirect_to @path_subject
  end

  private

  def params_attach
    params.require(:type_policy).permit(:policy_id)
  end

  def prepare_subject
    subject_id = params.keys.select { |p| p.match(/^\w+_id$/) }
    if subject_id && subject_id.size == 1
      subject_id = subject_id[0]
      subject_class = subject_id.to(-4).capitalize
    else
      return false
    end
    @subject_class = Object.const_get subject_class
    @subject_id = params[subject_id]
    @subject = @subject_class.find(@subject_id)
    @path_attach_create = send("admin_#{subject_class.downcase}_type_policies_path", @subject)
    @path_attach_new = send("new_admin_#{subject_class.downcase}_type_policy_path", @subject)
    @path_subject = send("admin_#{subject_class.downcase}_path", @subject)
  end
end
