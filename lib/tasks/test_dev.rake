task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    Task.delete_all
    User.delete_all
  end 


  #usernames = Array.new { Faker::Name.first_name }

  #usernames << "alice"
  #usernames << "bob"
  #usernames << "charlie"
  #usernames << "doug"
  #usernames << "eric"
  #usernames << "frank"
  #usernames << "george"
  

  #usernames.each do |username|
  #  User.create(
  #    email: "#{username}@example.com",
  #    password: "password",
  #    username: username.downcase,
  #  )
  #end
 
  #user = User.all





  
  #Task.statuses.values.each do |status|
  #  rand(3..10).times do
  #    user.tasks.create(
  #      content: Faker::Hipster.sentence,
  #      status: status
  #    )
  #  end
  #end








  

  #users.each do |user|
  #  rand(15).times do
  #    photo = user.own_photos.create(
  #      caption: Faker::Quote.jack_handey,
  #      image: "https://robohash.org/#{rand(9999)}"
  #    )

  #    user.followers.each do |follower|
  #      if rand < 0.5
  #        photo.fans << follower
  #      end

  #      if rand < 0.25
  #        photo.comments.create(
  #          body: Faker::Quote.jack_handey,
  #          author: follower
  #        )
  #      end
  #    end
  #  end
  #end









  task prime: :environment do
    user = User.find_or_create_by(email: "alice@example.com") do |user|
      user.password = "password"
    end

    user.tasks.destroy_all

    Task.statuses.values.each do |status|
      rand(3..10).times do
        user.tasks.create(
          content: Faker::Hipster.sentence,
          status: status
        )
      end
    end
  end



  ending = Time.now
  #p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Task.count} tasks."
end
