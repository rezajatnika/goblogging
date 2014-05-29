namespace :db do
  desc 'Fill the database with sample user and post'
  task populate: :environment do
    user = User.create!(email: Faker::Internet.email,
                        first_name: Faker::Name.first_name,
                        last_name: Faker::Name.last_name,
                        password: 'secret',
                        password_confirmation: 'secret')
    5.times do
      title = Faker::Lorem.sentence
      content = Faker::Lorem.paragraph(20)
      user.posts.create!(title: title, content: content)
    end
  end
end
