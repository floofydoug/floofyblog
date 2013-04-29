namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    [FinalTweet].each(&:delete_all)
    
    FinalTweet.populate 50 do |t|
      t.text = Faker::Lorem.sentences(sentence_count = 1)
      t.created_at = 2.years.ago..Time.now
      t.score = [1, 2, 4, 6, 25, 37, 45, 99, 100]
      end
    end
  end
    
