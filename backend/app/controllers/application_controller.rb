# class ApplicationController < ActionController::Base
#   # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
#   protect_from_forgery with: :null_session
#   allow_browser versions: :modern
#   def test
#     render json: { message: 'This is a test message from Rails' }
#   end
# end


class ApplicationController < ActionController::API
  def test
    render json: { message: 'This is a test message from Rails' }
  end
end
