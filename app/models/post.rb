class Post < ApplicationRecord
  belongs_to :user

  def user_email
    user.email
  end

  def formatted_date_time
    created_at.strftime("%d %B %Y %H:%M")
  end
end
