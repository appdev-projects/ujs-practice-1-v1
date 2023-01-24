task sample_data: :environment do
  p "Creating sample data"

  if Rails.env.development?
    Task.delete_all
    User.delete_all
  end 

  user = User.find_or_create_by(email: "alice@example.com") do |user|
    user.password = "password"
  end

  Task.statuses.values.each do |status|
    rand(3..10).times do
      user.tasks.create(
        content: Faker::Hipster.sentence,
        status: status
      )
    end
  end

  ending = Time.now

  p "There are now #{User.count} users."
  p "There are now #{Task.count} tasks."
end
