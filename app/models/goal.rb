class Goal < ActiveRecord::Base
  belongs_to :user

  def dateify
    deadline.strftime("%B %d, %Y")
  end
end
