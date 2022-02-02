class Post < ApplicationRecord
  before_create do
    self.expires_at = created_at + 1.minute
  end

  def add_30_seconds
    self.expires_at = expires_at + 30.seconds
    save!
  end
end
