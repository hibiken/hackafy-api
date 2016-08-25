class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  attr_reader :current_user

  def authenticate_user!
    authenticate_user_from_token || render_unauthorized
  end

  def pagination_dict(object)
    {
      current_page: object.current_page,
      next_page: object.next_page,
      prev_page: object.previous_page,
      total_pages: object.total_pages,
      total_count: object.total_entries
    }
  end

  protected

    def authenticate_user_from_token
      if user_id_in_token?
        @current_user ||= User.find_by(id: auth_token[:user_id])
      else
        nil
      end
    end

    def render_unauthorized
      self.headers['WWW-Authenticate'] = 'Token realm="Application"'
      render json: { errors:  ['Bad credentials'] }, status: 401
    end

    def user_id_in_token?
      http_token && auth_token && auth_token[:user_id]
    end

    def http_token
      authenticate_with_http_token do |token|
        @http_token = token
      end
    end

    def auth_token
      begin
        @auth_token ||=  JsonWebToken.decode(http_token)
      rescue JWT::VerificationError, JWT::DecodeError
        return nil
      end
    end
end
