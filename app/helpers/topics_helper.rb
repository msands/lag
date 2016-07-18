module TopicsHelper

  def topic_owner
    current_user.id == @topic.user_id
  end

end
