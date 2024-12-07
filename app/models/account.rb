# == Schema Information
#
# Table name: accounts
#
#  id         :binary(16)       not null, primary key
#  name       :string           not null
#  slug       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_accounts_on_id    (id) UNIQUE
#  index_accounts_on_slug  (slug) UNIQUE
#
class Account < ApplicationRecord
  has_many :account_users
  has_many :users, through: :account_users

  validates :name, presence: true
  validates :slug, presence: true, uniqueness: true

  before_validation :generate_slug

  protected

  def generate_slug
    if slug.blank? && name.present?
      base_slug = name.parameterize
      new_slug = base_slug

      while Account.where(slug: new_slug).exists?
        random_number = rand(1000..9999)
        new_slug = "#{base_slug}-#{random_number}"
      end

      self.slug = new_slug
    end
  end
end
