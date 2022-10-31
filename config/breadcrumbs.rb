crumb :root do
  link '<i class="fa-solid fa-house"></i> Home'.html_safe, root_path
end

crumb :gear_powers_index do
  link "ギアパワー", gear_powers_path
  parent :root
end

crumb :gear_powers_show do |gear_power|
  link gear_power.name, gear_power_path(gear_power)
  parent :gear_powers_index
end

crumb :users_new do
  link "ユーザー登録", new_user_registration_path
  parent :root
end

crumb :users_sign_in do
  link "ログイン", new_user_session_path
  parent :root
end

crumb :users_show do |user|
  link user.name, user_path(user)
  parent :root
end
