class Post < ApplicationRecord
  before_create do
    self.expires_at = created_at + 1.minute
  end

  scope :live, ->  { where('expires_at > ?', DateTime.now.utc).order(expires_at: :asc) }

  def add_30_seconds
    self.expires_at = expires_at + 30.seconds
    save!
  end
end
