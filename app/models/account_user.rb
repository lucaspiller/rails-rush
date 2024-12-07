# == Schema Information
#
# Table name: account_users
#
#  id         :binary(16)       not null, primary key
#  role       :string           default("owner"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :binary           not null
#  user_id    :binary           not null
#
# Indexes
#
#  index_account_users_on_account_id_and_user_id  (account_id,user_id) UNIQUE
#  index_account_users_on_id                      (id) UNIQUE
#  index_account_users_on_user_id_and_account_id  (user_id,account_id) UNIQUE
#
# Foreign Keys
#
#  account_id  (account_id => accounts.id)
#  user_id     (user_id => users.id)
#
class AccountUser < ApplicationRecord
  belongs_to :account
  belongs_to :user

  attribute :account_id, :uuid_v7
  attribute :user_id, :uuid_v7

  validates :role, presence: true
end
