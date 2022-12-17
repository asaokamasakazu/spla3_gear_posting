crumb :root do
  link '<i class="fa-solid fa-house"></i> Home'.html_safe, root_path
end

crumb :contacts_new do
  link "お問い合わせ", new_contact_path
  parent :root
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

crumb :users_list do
  link "ユーザー", list_users_path
  parent :root
end

crumb :users_show do |user|
  link user.name, user_path(user)
  parent :users_list
end

crumb :users_account do
  link "アカウント情報", account_users_path
  parent :root
end

crumb :users_edit do
  link "アカウント編集", edit_user_registration_path
  parent :users_account
end

crumb :posts_new do
  link "新規投稿", new_post_path
  parent :root
end

crumb :posts_index do
  link "投稿", posts_path
  parent :root
end

crumb :posts_show do |post|
  link post.title, post_path(post)
  parent :posts_index
end

crumb :posts_edit do |post|
  link "投稿編集", edit_post_path(post)
  parent :posts_show, post
end
