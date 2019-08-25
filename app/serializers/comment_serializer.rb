class CommentSerializer < ActiveModel::Serializer
  def initialize(comment_object)
    @comment = comment_object
  end

  def to_serialized_json
      options = {
        except: [:updated_at, :created_at]
      }
      @comment.to_json(options)
  end
end
