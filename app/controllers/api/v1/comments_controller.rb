class Api::V1::CommentsController < ApplicationController
    def index 
        comment = Comment.all 
        render json: CommentSerializer.new(comment).to_serialized_json
    end

    def create
        comment = Comment.new(comment_params)
        if comment.save!
            render json: comment_params
        else
            render :new 
        end
    end

    def comment_params
        params.require(:comment).permit(:user_id, :site_id, :content, :username)
    end
end
