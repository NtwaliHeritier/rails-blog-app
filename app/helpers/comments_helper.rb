module CommentsHelper
    def comments_helper
        params.require(:comment).permit(:author_name, :body)
    end
end
