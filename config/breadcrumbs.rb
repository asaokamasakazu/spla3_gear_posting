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
