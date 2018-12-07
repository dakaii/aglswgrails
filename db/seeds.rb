6.times do
    project = Project.new
    project.title = Faker::Zelda.game
    project.thumbnail = Faker::Internet.domain_name
    project.description = Faker::Zelda.item
    project.save()

    user = User.new
    user.email = 'user@bananas.com'
    user.password = 'bananaBro'
    user.password_confirmation = 'bananaBro'
    user.save()
end