module Form
  class TransferPayload
    include ActiveModel::API
    attr_accessor :source_account,
                  :destination_account,
                  :amount

    validates :source_account, :destination_account, :amount, presence: true
    validates :amount, numericality: :only_integer

    def initialize(params)
      extracted_params = params.extract!(:source_account, :destination_account, :amount)
      extracted_params.permit!
      super(extracted_params)
      validate!
    rescue ActiveModel::ValidationError => e
      puts e
      raise Errors::InvalidParameterError
    end
  end
end