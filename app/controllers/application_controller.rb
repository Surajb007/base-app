class ApplicationController < ActionController::API

    protected
    
    def encode_token(payload = {})
        exp=1.hours.from_now
        payload[:exp] = exp.to_i
        JWT.encode(payload, Rails.application.secrets.secret_key_base.to_s)
    end
end
