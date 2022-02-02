class Post < ApplicationRecord
  before_create do
    self.expires_at = created_at + 1.minute
  end
end
