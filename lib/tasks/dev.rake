namespace :dev do
	task fake_language: :environment do 
		Language.destroy_all
		20.times do |l|
			name = FFaker::Locale::language
			Language.create!(
				name: name
			)
			puts "Language #{name} is created"
		end
		puts "Totally #{Language.count} languages have been created"
	end

	task fake_user: :environment do
		User.destroy_all
    20.times do |i|
      user_name = FFaker::Name.first_name
      User.create!(
        username: user_name,
        email: "#{user_name}@example.com",
        password: "12345678",
      )
    end

    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

 	task fake_teaching: :environment do
 		Teaching.destroy_all
    Language.all.each do |language|
      3.times do |i|
        language.teachings.create(
          user: User.all.sample
          )
      end
    end

    puts "have created fake teachings"
    puts "now you have #{Teaching.count} teaching data"
  end

  task fake_learning: :environment do
 		Learning.destroy_all
    Language.all.each do |language|
      3.times do |i|
        language.learnings.create(
          user: User.all.sample
          )
      end
    end

    puts "have created fake learnings"
    puts "now you have #{Learning.count} learnings data"
  end


  task fake_friendship: :environment do
    Friendship.destroy_all
    User.all.each do |user|
      rand(1..10).times do
        user.friendships.create(
          friending_id: User.where.not(id: user.id).sample.id
        )
      end
    end

    puts "have created fake friendships"
    puts "now you have #{Learning.count} friendships data"
  end

  task fake_vocabs: :environment do
    Vocab.destroy_all
    10.times do |i|
      Vocab.create!(
        language: Language.all.sample,
        student_id: User.all.sample.id,
        lesson: Lesson.all.sample,
        key: "test_key",
        value: "test_value"
      )

    end
    puts "#{Vocab.count} vocabs are created"
  end
end
