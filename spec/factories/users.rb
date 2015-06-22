FactoryGirl.define do
  factory :user do
    provider "email"
    uid SecureRandom.uuid
    sequence(:email) { |n| "person_#{n}@gmail.com"}
    password "12345678"
    password_confirmation "12345678"
    sequence(:first_name) {|f| "first_name_#{f}"}
    sequence(:last_name) {|f| "last_name_#{f}"}
  end
end