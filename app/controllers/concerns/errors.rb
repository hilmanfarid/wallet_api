# frozen_string_literal: true
class ApplicationError <StandardError
  attr_accessor :code
  def initialize(msg, code)
    @code = code
    super(msg)
  end
end

module Errors
  class UnauthorizedError < ApplicationError
    def initialize(msg = "Unauthorized")
      super(msg, 401)
    end
  end

  class InvalidAccount < ApplicationError
    def initialize(msg = "Invalid Account")
      super(msg, 422)
    end
  end

  class InvalidSourceAccount < ApplicationError
    def initialize(msg = "Invalid Source Account")
      super(msg, 422)
    end
  end

  class InsufficientBalanceError < ApplicationError
    def initialize(msg = "Insufficient Balance")
      super(msg, 422)
    end
  end

  class InvalidDestinationError < ApplicationError
    def initialize(msg = "Invalid Destination Account")
      super(msg, 422)
    end
  end

  class TransactionLimitError < ApplicationError
    def initialize(msg = "Transaction Amount Limit Reached")
      super(msg, 422)
    end
  end

  class InvalidParameterError < ApplicationError
    def initialize(msg = "Bad Request")
      super(msg, 400)
    end
  end

  class NotFoundError < ApplicationError
    def initialize(msg = "Not Found")
      super(msg, 404)
    end
  end

  class UnprocessableEntityError < ApplicationError
    def initialize(msg = "Unprocessable Entity")
      super(msg, 404)
    end
  end
end
