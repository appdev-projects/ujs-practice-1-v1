def sample_data do

##Destroy Existing Data## 
  User.destroy
  Task.destroy

##Create 10 Users##

  p "creating users."

  10.times do
  new_user = User.create(
    email:      Faker::First_name.first_name+"@example.com",
    password:   "password"
  )
  end

  p User.count.to_s + " users created"

##Create Danny##
  
  p "creating Danny."

  danny = User.create(
    email:      "danny@example.com",
    password:   "password"
  )

  p "Heere's Danny!"
  p danny


##Create Tasks##

100.times do
  random_user = User.all.sample
  
  new_task = Task.create(
    body:      Faker::Marketing.buzzwords,
    owner_id:   random_user.id
  )
  end

end
