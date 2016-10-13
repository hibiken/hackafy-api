class FollowSuggestionsController < ApplicationController
  before_action :authenticate_user!

  def index
    # TODO: find suggestions using graph search
    users = User.order(created_at: :desc).limit(10) - [current_user] # <-- this is temporary
    render json: users, each_serializer: FollowSuggestionSerializer, status: 200
  end
end
