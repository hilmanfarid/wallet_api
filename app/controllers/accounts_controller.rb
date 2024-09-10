class AccountsController < ApplicationController
  before_action :authorize

  # GET /accounts
  def index
    accounts = Account.where(user_id: @current_user.id)
    serialized_accounts = []
    accounts.each do |account|
      serialized_accounts.append(Serializer::Account.new(account))
    end

    render json: serialized_accounts
  end
end
