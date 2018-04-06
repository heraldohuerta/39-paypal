module ApplicationHelper

def isadmin?
  verifica_admin = User.find(current_user.id)
  if verifica_admin.nil?
     redirect_to root_path, notice: 'Problemas para encontrar el usuario.'
  end

  if verifica_admin.isadmin
    true
  else
    false
  end
end

end
