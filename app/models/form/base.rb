module Form
  class Base
    include ActiveModel::API

    def initialize(params)
      # params.permit!
      # puts params.to_h
      super(params)
      validate!
      @errors&.each do |error|
        puts error.message
      end
    end
  end
end