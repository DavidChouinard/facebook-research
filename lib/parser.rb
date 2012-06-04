class Parser < Struct.new(:access_token)

  def perform
    @graph = Koala::Facebook::API.new(access_token)
    me = @graph.get_objects("me")

    result = @graph.batch do |batch_api|
      batch_api.get_connections("me", "friends", {:limit => 5000}, :batch_args => {:name => "get-friends"})
      batch_api.get_objects("{result=get-friends:$.data.*.id}")
    end

    result = result[1]
    me = @graph.get_objects("me")
    result.merge!(me)
    result = result.map { |k,v| v }

    result.each do |user|
      # Delete all the user stuff we don't keep
      user.delete("name")
      user.delete("first_name")
      user.delete("middle_name")
      user.delete("last_name")
      user.delete("link")
      user.delete("username")
      user.delete("updated_time")
      user.delete("timezone")
      user.delete("location")
      user.delete("languages")
      user.delete("verified")
      user.delete("relationship_status")

      if user.has_key?("birthday")
        begin
          user["birthday"] = Date.strptime(user["birthday"], '%m/%d/%Y')
        rescue ArgumentError
          # User doesn't only make available month/day of birthday
          user["birthday"] += "/0001"
          user["birthday"] = Date.strptime(user["birthday"], '%m/%d/%Y')
        end
      end

      user["friend_of"] = me["me"]["id"].to_i

      user["facebook_id"] = user.delete("id")
    end

    User.create(result)

    #Tried doing a batch request for posts, but large requests fail
    #result = @graph.batch do |batch_api|
      #batch_api.get_connections("me", "friends", {:limit => 10}, :batch_args => {:name => "get-friends"})
      #batch_api.graph_call("/feed?ids={result=get-friends:$.data.*.id}", {:limit => 100}, "get", {})
    #end
    #result = result[1]

    friends = @graph.get_connections("me", "friends", {:limit => 5000}).map { |v| v["id"].to_i }
    friends << me["me"]["id"].to_i

    friends.each do |friend|
      begin
        # Graph API sometimes randomly throws "Unknown error" (code 1)
        messages = @graph.get_connections(friend, "feed", {:limit => 5000})
      rescue Koala::Facebook::APIError => e
        # TODO
        #if e.fb_error_code == 1
          break
        #else
          puts e.message
          puts e.backtrace.inspect
        #end
      end

      #pp messages
          #raise "Whatever!"

      while true
        messages.each do |message|
          #pp message

          if message.has_key?("link")
            message["has_link"] = true
            message.delete("link")
          end

          if message.has_key?("source")
            message["has_video"] = true
            message.delete("source")
          end

          if message.has_key?("with_tags")
            message["has_with_tag"] = true
            message.delete("with_tags")
          end

          if message.has_key?("place")
            message["has_place"] = true
            message.delete("place")
          end

          if message.has_key?("application")
            message["application_name"] = message["application"]["name"]
            message.delete("properties")
            message.delete("application")
          end

          message.delete("message_tags")

          if message.has_key?("to") && !message["to"]["data"][0].nil?
            message["to"] = message["to"]["data"][0]["id"]
          else
            #Extract user id from the post id
            message["to"] = /(\d+)_/.match(message["id"])[1].to_i
          end

          if message.has_key?("story_tags")
            message["tag_count"] = 0
            message["story_tags"].each do |key, value|
              message["tag_count"] += value.length
              if value[0]["id"] == message["to"]
                message["recipient_is_tagged"] = true
              end
            end
            message.delete("story_tags")
          end
          if message.has_key?("likes")
            message["like_count"] = message["likes"]["count"]
            message.delete("likes")
          end

          message["post_type"] = message.delete("type")

          if message.has_key?("story")
            message["content"] = message.delete("story")
          elsif message.has_key?("message")
            message["content"] = message.delete("message")
            message["post_type"] + "_message"
          end

          message["comment_count"] = message["comments"]["count"]

          if message["comments"].has_key?("data")
            message["comments"]["data"].each do |comment|
              comment["facebook_id"] = comment.delete("id")
              comment["from"] = comment["from"]["id"]
              comment["to"] = message["to"]
              comment["facebook_created_at"] = DateTime.parse(comment.delete("created_time"))

              comment.delete("message_tags")

              unless comment.has_key?("likes")
                comment["likes"] = 0
              end
            end
            message["comments_attributes"] = message["comments"]["data"]
          end

          message["from"] = message.delete("from")["id"]
          message["facebook_id"] = message.delete("id")
          message["facebook_created_time"] = DateTime.parse(message.delete("created_time"))
          message["facebook_updated_time"] = DateTime.parse(message.delete("updated_time"))

          message.delete("comments")
          message.delete("shares")
          message.delete("name")
          message.delete("actions")
          message.delete("icon")
          message.delete("privacy")
          message.delete("object_id")
          message.delete("picture")
          message.delete("description")
          message.delete("caption")

          Message.create(message)
        end

        #begin
          messages = messages.next_page
        #rescue Koala::Facebook::APIError => e
          ##if e.fb_error_code == 1
            #break
          ##else
            #puts e.message
            #puts e.backtrace.inspect
          ##end
        #end

        if messages.nil? || messages.empty?
          break
        end
      end
    end

  end
end
