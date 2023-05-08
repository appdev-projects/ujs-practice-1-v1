namespace :dev do
  desc "Generates sample data"
  task :generate => :environment do
    
    # Create user
    user = User.find_or_create_by(email: 'alice@example.com') do |u|
      u.password = 'password'
    end

    user.tasks.destroy_all
    
    # Create tasks
    20.times do
      user.tasks.create(
        content: Faker::Hacker.say_something_smart,
        status: Task.statuses.keys.sample
      )
    end
    puts "Created #{Tasks.count} tasks"
  end
end
