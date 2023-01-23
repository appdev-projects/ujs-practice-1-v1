desc "Fill the database tables with some sample data"
task sample_data: :environment do
  starting = Time.now

  Task.delete_all
  User.delete_all

  people = Array.new
  people << { first_name: "Alice", last_name: "Smith" }
  people << { first_name: "Bob", last_name: "Smith" }
  people << { first_name: "Carol", last_name: "Smith" }
  people << { first_name: "Doug", last_name: "Smith" }

  people.each do |person|
    username = person.fetch(:first_name).downcase

    user = User.create(
      email: "#{username}@example.com",
      password: "password",
      username: username.downcase,
    )

    p user.errors.full_messages
  end

  users = User.all

  # users.each do |user|
  #   rand(15).times do
  #     a_task = user.tasks.create(
  #       body: Faker::Quote.jack_handey,
  #       status: ["notstarted", "pending", "complete"].sample,
  #     )
  #     p a_task.errors.full_messages
  #   end
  # end
  users.each do |user|
    Task.statuses.values.each do |status|
      10.times do
        user.tasks.create(
          body: Faker::Quote.jack_handey,
          status: status,
        )
      end
    end
  end

  ending = Time.now
  p "It took #{(ending - starting).to_i} seconds to create sample data."
  p "There are now #{User.count} users."
  p "There are now #{Task.count} tasks."
end
