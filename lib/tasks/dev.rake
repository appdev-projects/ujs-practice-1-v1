task sample_data: :environment do

##Destroy Existing Data## 
  User.destroy_all
  Task.destroy_all

##Create 10 Users##

  p "creating users."

  10.times do
  new_user = User.create(
    email:      Faker::Name.first_name+"@example.com",
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

p "Creating tasks."

100.times do
  random_user = User.all.sample
  
  new_task = Task.create(
    body:       Faker::Marketing.buzzwords,
    status:     ["not yet started", "in progress", "completed"].sample,
    owner_id:   random_user.id
  )
  end

  p Task.count.to_s + " tasks created"
  p "Here is one:"
  p Task.all.sample 

  # p "Here's a user with a task:"
  # p User.all.where({ tasks_count > 0).sample
  
end
