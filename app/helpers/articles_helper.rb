module ArticlesHelper
    def params_helper
        params.require(:article).permit(:title, :body, :tag_list, :image)
    end
end
