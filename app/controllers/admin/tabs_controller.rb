module Admin

class TabsController < Admin::ApplicationController
  before_action :set_tab, only: [ :edit, :update, :destroy]

  def index
    @tabs = @site.tabs
  end

  def new
    @tab = Tab.new
    @articles = Article.where(site: @site)
    @categories = Category.where(site: @site)
  end

  def edit_tab_category
  end

  def new_tab_category
    @tab = Tab.new
    @articles = Article.where(site: @site)
    @categories = Category.where(site: @site)
  end

  def edit
    @articles = Article.where(site: @site)
    @categories = Category.where(site: @site)
  end

  def create
    @tab = Tab.new(tab_params)
    @tab.site = @site

    respond_to do |format|
      if @tab.save
        @tab.update(url: "/#{@site.url}/#{@tab.item.slug}")
        format.html { redirect_to admin_menu_path @site.url, @menu, notice: 'Tab was successfully created.' }
      else
        @articles = Article.where(site: @site)
        @categories = Category.where(site: @site)
        format.html { render :new }
      end
    end
  end

  def update

    respond_to do |format|
      if @tab.update(tab_params)
        @tab.update(url: "/#{@site.url}/#{@tab.item.slug}")
        format.html { redirect_to admin_menu_path @site.url, @menu, notice: 'Tab was successfully updated.' }
      else

        @articles = Article.where(site: @site)
        @categories = Category.where(site: @site)
        format.html { render :edit }
      end
    end
  end

  def destroy
    @tab.destroy
    respond_to do |format|
      format.html { redirect_to admin_menu_path @site.url, notice: 'Tab was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tab
      @tab = Tab.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tab_params
      params.require(:tab).permit(:title, :order, :item_type, :item_id)
    end
end

end
