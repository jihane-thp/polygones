module Admin

  class CommentsController < Admin::ApplicationController

  before_action :set_comment, only: [:show, :destroy]

  def index
    @comments = Comment.where(article: @user.articles.ids).order("created_at DESC")
  end

  def show
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_comments_url, notice: 'Commentaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:name, :content)
    end
end

end
