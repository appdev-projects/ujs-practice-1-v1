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
      private: [true, false].sample,
    )
  end
 
  users = User.all

  users.each do |user|
    rand(20).times do
      user.followers.each do |follower|
        if rand < 0.5
          photo.fans << follower
        end

        if rand < 0.25
          photo.comments.create(
            body: Faker::Quote.jack_handey,
            author: follower
          )
        end
      end
    end
  end

  ending = Time.now
  #p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Task.count} tasks."
end
