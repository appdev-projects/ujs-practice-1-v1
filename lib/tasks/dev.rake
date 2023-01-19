task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    Task.destroy_all
    User.destroy_all
  end


  usernames = Array.new{Faker::Name.first_name}
  3.times do
    this_name = Faker::Name.first_name
    usernames << this_name
  end
  usernames << "alice"
  usernames << "bob"
  p "List made"

  usernames.each do |username|
    last_name = Faker::Name.last_name   
    User.create(
      email: "#{username}@example.com",
      password: "password"
    )
  end
  p "#{User.count} users have been created."


end
