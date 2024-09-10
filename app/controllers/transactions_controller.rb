class TransactionsController < ApplicationController
  before_action :authorize

  include Errors
  include TransactionService


  # GET /transactions
  def index
    transactions = Transaction.where(user_id: current_user.id)
    serialized_transactions = []
    transactions.each do |trx|
      serialized_transactions.append(Serializer::Transaction.new(trx))
    end

    render json: serialized_transactions
  end

  # GET /transactions/1
  def show
    transaction = Transaction.find_by(id: params[:id], user_id: current_user.id)
    raise Errors::NotFoundError if transaction.nil?

    render json: Serializer::Transaction.new(transaction)
  end


  # POST /transaction/transfer
  def transfer
    payload = Form::TransferPayload.new(params)
    transaction = TransactionService.transfer(current_user, payload)

    result = Serializer::Transaction.new(transaction)
    render json: result.instance_values
  end

  # GET /mutations/1
  def mutations
    if params[:account_id].blank?
      raise Errors::InvalidParameterError
    end
    mutations = TransactionService.mutations(current_user, params[:account_id])
    serialized_mutations = []
    mutations.each do |mutation|
      serialized_mutations.append(Serializer::Transaction.new(mutation))
    end

    render json: serialized_mutations
  end

end
