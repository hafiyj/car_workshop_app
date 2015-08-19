Workshop.create!(name: "CarServIt Sdn. Bhd.",
                 email: "carservit@gmail.com",
                 address: "MaGIC @ CyberJaya",
                 contact_num: "0389951515",
                 com_reg_num: "R123456789",
                 password: "111111",
                 password_confirmation: "111111",
                 admin:     true,
                 activated: true,
                 activated_at: Time.zone.now)

Workshop.create!(name: "One Stop Service Centre",
                 email: "onestop@gmail.com",
                 address: "MaGIC @ CyberJaya",
                 contact_num: "0389951543",
                 com_reg_num: "R123456788",
                 password: "111111",
                 password_confirmation: "111111",
                 admin:     false,
                 activated: true,
                 activated_at: Time.zone.now)

18.times do |n|
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

11.times do |n|
  name = Faker::Name.name
  contact_number = "012-111#{1000+(n+1)}"
  car_model = "Perodua Myvi"
  car_reg_number = "AJA #{1000+(n+1)}"
  service_type = "Minor Service"
  time = "#{00+(n+1)}:00 PM"
  date = "#{18+(n+1)}/08/2015"

  Reservation.create!(
  name: name,
  contact_number: contact_number,
  car_model: car_model,
  car_reg_number: car_reg_number,
  service_type: service_type,
  time: time,
  date: date,
  workshop_id: 1
  )
end

8.times do |n|
  name = Faker::Name.name
  contact_number = "012-111#{1000+(n+1)}"
  car_model = "Perodua Axia"
  car_reg_number = "AJE #{1000+(n+1)}"
  service_type = "Major Service"
  time = "#{00+(n+1)}:00 PM"
  date = "#{18+(n+1)}/08/2015"

  Reservation.create!(
  name: name,
  contact_number: contact_number,
  car_model: car_model,
  car_reg_number: car_reg_number,
  service_type: service_type,
  time: time,
  date: date,
  workshop_id: 1
  )
end

8.times do |n|
  name = Faker::Name.name
  contact_number = "014-121#{1000+(n+1)}"
  car_model = "Perodua Alza"
  car_reg_number = "AJK #{1000+(n+1)}"
  service_type = "Major Service"
  time = "#{02+(n+1)}:00 PM"
  date = "26/08/2015"

  Reservation.create!(
  name: name,
  contact_number: contact_number,
  car_model: car_model,
  car_reg_number: car_reg_number,
  service_type: service_type,
  time: time,
  date: date,
  workshop_id: 1
  )
end

3.times do |n|
  name = Faker::Name.name
  contact_number = "016-115#{1000+(n+1)}"
  car_model = "Toyota Camry"
  car_reg_number = "W #{1000+(n+1)} A"
  service_type = "Major Service"
  time = "#{8+(n+1)}:00 AM"
  date = "26/08/2015"

  Reservation.create!(
  name: name,
  contact_number: contact_number,
  car_model: car_model,
  car_reg_number: car_reg_number,
  service_type: service_type,
  time: time,
  date: date,
  workshop_id: 1
  )
end

9.times do |n|
  name = Faker::Name.name
  contact_number = "018-171#{1000+(n+1)}"
  car_model = "Toyota Vios"
  car_reg_number = "W #{1000+(n+1)} B"
  service_type = "Car Checkup"
  time = "#{00+(n+1)}:00 PM"
  date = "#{20+(n+1)}/08/2015"

  Reservation.create!(
  name: name,
  contact_number: contact_number,
  car_model: car_model,
  car_reg_number: car_reg_number,
  service_type: service_type,
  time: time,
  date: date,
  workshop_id: 1
  )
end

30.times do |n|
  name = Faker::Name.name
  contact_number = "019-175#{1000+(n+1)}"
  car_model = "Honda City"
  car_reg_number = "WB #{1000+(n+1)} Z"
  service_type = "Car Checkup"
  time = "02:00 PM"
  date = "#{00+(n+1)}/9/2015"

  Reservation.create!(
  name: name,
  contact_number: contact_number,
  car_model: car_model,
  car_reg_number: car_reg_number,
  service_type: service_type,
  time: time,
  date: date,
  workshop_id: 1
  )
end

28.times do |n|
  name = Faker::Name.name
  contact_number = "010-125#{1000+(n+1)}"
  car_model = "Honda Accord"
  car_reg_number = "WB #{1000+(n+1)} S"
  service_type = "Car Checkup"
  time = "03:00 PM"
  date = "#{00+(n+1)}/10/2015"

  Reservation.create!(
  name: name,
  contact_number: contact_number,
  car_model: car_model,
  car_reg_number: car_reg_number,
  service_type: service_type,
  time: time,
  date: date,
  workshop_id: 1
  )
end

15.times do |n|
  name = Faker::Name.name
  contact_number = "010-145#{1000+(n+1)}"
  car_model = "Honda Jazz"
  car_reg_number = "WWW #{1000+(n+1)}"
  service_type = "Car Checkup"
  time = "12:00 PM"
  date = "#{00+(n+1)}/11/2015"

  Reservation.create!(
  name: name,
  contact_number: contact_number,
  car_model: car_model,
  car_reg_number: car_reg_number,
  service_type: service_type,
  time: time,
  date: date,
  workshop_id: 1
  )
end
