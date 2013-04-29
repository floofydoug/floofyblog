require 'clockwork'
include Clockwork

handler do |job|
  puts "Queueing job: #{Pulling Tweets with Certain Hashtags}"
end

every(1.minute, 'StoreHashTagTweets')
end