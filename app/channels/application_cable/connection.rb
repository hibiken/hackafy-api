module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

      def find_verified_user
        if current_user = User.find_by(id: auth_token[:user_id])
          current_user
        else
          reject_unauthorized_connection
        end
      end

      def auth_token
        begin
          @auth_token ||= JsonWebToken.decode(request.params[:token])
        rescue JWT::VerificationError, JWT::DecodeError
          return OpenStruct.new(user_id: nil)
        end
      end

  end
end
