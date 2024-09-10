class ApplicationController < ActionController::API
  include Errors

  def current_user
    @current_user ||= begin
      Token.authorize(request.env["HTTP_AUTHORIZATION"])
    end
  end

  def decode_token

  end

  def authorize
    raise Errors::UnauthorizedError.new if current_user.id.nil?
  end

  rescue_from ApplicationError do |exception|
    render_error(exception)
  end

  def render_error(exception)
    render json: { error: { message: exception.message } }, status: exception.code
  end
end
