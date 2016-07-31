class CurrentUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :username, :created_at
end
