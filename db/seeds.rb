# Create temporary edward loveall user
user_params = {email: 'edward@edwardloveall.com', password: '123', admin: true}
Monban.config.sign_up_service.new(user_params).perform