Workshop.create!(name: "Car Workshop App - CarServIt [Admin]",
                 email: "carservit@gmail.com",
                 address: "MaGIC @ CyberJaya",
                 contact_num: "0389951515",
                 com_reg_num: "R123456789",
                 password: "123456",
                 password_confirmation: "123456",
                 admin:     true,
                 activated: true,
                 activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@carworkshopapp.com"
  address = "Lot #{n+1}, Jalan Taman #{n+1}, 54000 Kuala Lumpur, WP"
  contact_num = "0#{38990000+(n+1)}"
  com_reg_num = "R#{000000000+(n+1)}"
  password = "password"
  Workshop.create!(name:  name,
               email: email,
               address: address,
               contact_num: contact_num,
               com_reg_num: com_reg_num,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end
