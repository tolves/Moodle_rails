module Permission
  extend ActiveSupport::Concern

  def permissions
    {
      'products' => {
          :user => %i[index show]
      },
      'users' => {
          :user => %i[show update edit]
      },
      'admin' => {
      },
      'admin/products' => {
      },
      'admin/brands' => {
      },
      'admin/categories' => {
      },
      'admin/prices' => {
      }
    }
  end

  def check_permission
    return true if current_user.admin?

    controller_permissions = permissions[controller_path]
    role = current_user.role.to_sym
    alert = 'You do not have enough permission'
    if controller_permissions.keys.include?(role)
      unless controller_permissions[role].include?(action_name.to_sym)
        flash.alert = alert
        return redirect_to :root
      end
      # if controller_name == 'users' && current_user != User.find(params[:id])
      #   flash.alert = alert
      #   redirect_to :root
      # end
    else
      flash.alert = alert
      redirect_to :root
      # head 403
    end
  end
end