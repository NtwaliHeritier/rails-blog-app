module ArticlesHelper
    def params_helper
        params.require(:article).permit(:title, :body)
    end
end
