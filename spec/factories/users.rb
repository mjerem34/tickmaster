FactoryGirl.define do
  # pseudo "pseudonyme"
  # password "password"
  # email "email@example.com"
  # name "name"
  # surname "surname"
  # ip_addr "127.0.0.1"
  # tel "0101010101"
  # mobile "0202020202"
  # tech_id 1
  # agency_id 1

  factory :factoryUser, class: User do
    pseudo Faker::Internet.user_name
    password Faker::Internet.password(8)
    email Faker::Internet.email
    name Faker::Name.first_name
    surname Faker::Name.last_name
    ip_addr Faker::Internet.ip_v4_address
    tel '0101010101'
    mobile '0202020202'
    agency_id 1
    # trait :TechStatusUser do
    tech_id 1
    # end
    # trait :TechStatusTech do
    #   tech_id 2
    # end
  end
end
