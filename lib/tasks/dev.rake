task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    Task.delete_all
    User.delete_all
  end 


  usernames = Array.new { Faker::Name.first_name }

  usernames << "alice"
  usernames << "bob"
  usernames << "charlie"
  usernames << "doug"
  usernames << "eric"
  usernames << "frank"
  usernames << "george"
  

  usernames.each do |username|
    User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
    )
  end
 
  users = User.all


  Task.statuses.values.each do |status|
    rand(3..10).times do
      user.tasks.create(
        content: Faker::Hipster.sentence,
        status: status
      )
    end
  end


  ending = Time.now
  #p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Task.count} tasks."
end
