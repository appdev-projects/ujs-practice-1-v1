task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    #Task.destroy_all
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

  usernames.each do |this_username|  
    User.create(
      email: "#{this_username}@example.com",
      username: this_username,
      password: "password"
    )
  end
  p "#{User.count} users have been created."

  all_users = User.all

  #Tasks
  all_users.each do |user|
    5.times do
      Task.create(
        user_id: user.id,
        content: Faker::TvShows::GameOfThrones.quote,
        status: "not_yet_started"
      )
    end
  end

  p  "#{Task.count} tasks have been created."
end
