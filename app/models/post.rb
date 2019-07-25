class Post < ApplicationRecord
  belongs_to :user

  delegate :email, :to => :user, :allow_nil => true

  def formatted_date_time
    created_at.strftime("%d %B %Y %H:%M")
  end
end
