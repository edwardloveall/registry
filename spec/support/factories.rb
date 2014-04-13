include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password_digest 'password'

    factory :admin do
      admin true
    end
  end

end
