json.extract! forum_post, :id, :forum_thread_id, :user_id, :body, :created_at, :updated_at
json.url forum_post_url(forum_post, format: :json)
