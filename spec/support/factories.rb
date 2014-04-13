include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password_digest 'password'

    factory :admin do
      admin true
    end
  end

  factory :product do
    name 'Hamilton Beach Slow Cooker'
    link 'http://www.amazon.com/dp/B00EZI26DW'
    price 49.85
    image Rack::Test::UploadedFile.new("#{Rails.root}/spec/assets/image.jpg", 'image/jpg')
  end
end
