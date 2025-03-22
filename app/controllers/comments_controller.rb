class CommentsController < ApplicationController
  def create
    the_photo_id = params.fetch("input_photo_id")

    new_comment = Comment.new

    new_comment.photo_id = the_photo_id
    new_comment.body = params.fetch("input_comment")
    new_comment.author_id = params.fetch("input_author_id")

    new_comment.save

    redirect_to("/photos/#{the_photo_id}")
  end
end
