class Api::V1::TokensController < ApplicationController
  def create
    @user = User.find_by_email(user_params[:email])
    # &.
    # Safe Navigation Operator. 
    # Introduced in Ruby 2.3.0, 
    # it lets you call methods on objects without worrying 
    # that the object may be nil(Avoiding an undefined method for nil:NilClass error), similar to the try method in Rails.Safe Navigation Operator. Introduced in Ruby 2.3.0, it lets you call methods on objects without worrying that the object may be nil(Avoiding an undefined method for nil:NilClass error), 
    # similar to the try method in Rails.
    # https://stackoverflow.com/questions/36812647/what-does-ampersand-dot-mean-in-ruby
    if @user&.authenticate(user_params[:password])
      render json: {token: JsonWebToken.encode(user_id: @user.id), email: @user.email}
    else
      head :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
