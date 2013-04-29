class Person < ActiveRecord::Base
  attr_accessible :name, :provider, :uid

  def self.from_omniauth(auth)
  where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
end

def self.create_from_omniauth(auth)
  create! do |person|
    person.provider = auth["provider"]
    person.uid = auth["uid"]
    person.name = auth["info"]["nickname"]
  end
end
end
