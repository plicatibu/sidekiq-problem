class User < Sequel::Model
  set_allowed_columns :name, :password

end
