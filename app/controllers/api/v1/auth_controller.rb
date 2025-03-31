class Api::V1::AuthController < ApplicationController
    SECRET_KEY = Rails.application.secrets.secret_key_base

    def signup
        user = User.new(user_params)
        if user.save
            token = encode_token(user.id)
            render json: { user: user, token: token }, status: created 
        else 
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def login 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            token = encode_token(user.id)
            render json: { user: user, token: token }, status: :ok 
        else 
            render json: { error: 'Credenciales inválidas' }, status: :unauthorized 
        end 
    end

    private 

    def user_params 
        params.permit(:name, :email, :password, :password_confirmation)
    end 

    def encode_token(user_id)
        JWT.encode({ user_id: user_id, exp: 24.hours.from_now.to_i }, SECRET_KEY)
    end
end
