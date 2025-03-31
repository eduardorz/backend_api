class ApplicationController < ActionController::API
    SECRET_KEY = Rails.application.secrets.secret_key_base

    def authenticate_request
        token = request.headers['Authorization']
        if token.present?
        begin
            decoded_token = JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
            @current_user = User.find(decoded_token[0]['user_id'])
        rescue JWT::DecodeError
            render json: { error: 'Token inválido' }, status: :unauthorized
        end
        else
        render json: { error: 'Token no encontrado' }, status: :unauthorized
        end
    end
end
