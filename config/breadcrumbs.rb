crumb :root do
  link "Home", root_path
end

crumb :gear_powers_index do
  link "ギアパワー", gear_powers_path
  parent :root
end
