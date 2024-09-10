# frozen_string_literal: true

module Constants
  module TransactionState
    CREATED = 1
    SUCCEEDED = 2
    FAILED = 3
  end
  TRANSACTION_STATE_MESSAGE = [ "", "created", "success", "failed" ]
end