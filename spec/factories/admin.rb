FactoryBot.define do
    factory :admin do
        name { 'testname' }
        email { Faker::Internet.email }
        password { 'password' }
        password_confirmation { 'password' }
    end
end