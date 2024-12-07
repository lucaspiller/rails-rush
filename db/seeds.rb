# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!(email: 'user@example.com', password: 'password', password_confirmation: 'password')

account1 = Account.create!(name: 'Acme Inc.')
account2 = Account.create!(name: 'Tech Corp.')
account3 = Account.create!(name: 'Pioneer Ltd.')

AccountUser.create!(account: account1, user: user, role: 'owner')
AccountUser.create!(account: account2, user: user, role: 'owner')
AccountUser.create!(account: account3, user: user, role: 'owner')
