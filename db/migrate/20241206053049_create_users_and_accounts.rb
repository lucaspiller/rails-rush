# frozen_string_literal: true

class CreateUsersAndAccounts < ActiveRecord::Migration[8.0]
  def change
    ###
    ### Users
    ###
    create_table :users, id: false do |t|
      t.binary :id, limit: 16, null: false, index: { unique: true }, primary_key: true

      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

    ###
    ### Accounts
    ###
    create_table :accounts, id: false do |t|
      t.binary :id, limit: 16, null: false, index: { unique: true }, primary_key: true

      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end

    add_index :accounts, [ :slug ], unique: true

    ###
    ### Account Users
    ###
    create_table :account_users, id: false do |t|
      t.binary :id, limit: 16, null: false, index: { unique: true }, primary_key: true

      t.references :account, type: :binary, null: false, foreign_key: true, index: false
      t.references :user, type: :binary, null: false, foreign_key: true, index: false
      t.string :role, null: false, default: 'owner'

      t.timestamps null: false
    end

    add_index :account_users, [ :account_id, :user_id ], unique: true
    add_index :account_users, [ :user_id, :account_id ], unique: true
  end
end
