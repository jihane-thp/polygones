module Admin
  class TemplatesController < Admin::ApplicationController
  before_action :set_template, only: [:show, :edit, :update, :destroy]


  def update_template

    if Template.find(params['template']['id'])
      @template = Template.find(params['template']['id'])
        @site.template =@template
        @site.save
        redirect_to admin_templates_path
    else
      format.html { redirect_to admin_templates_path }
    end

  end


  # GET /admin/templates
  # GET /admin/templates.json
  def index
    @templates = @site.templates
    @template = @site.template
  end

  # GET /admin/templates/1
  # GET /admin/templates/1.json
  def show
  end

  # GET /admin/templates/new
  def new
    @template = Template.new
  end

  # GET /admin/templates/1/edit
  def edit
  end

  # POST /admin/templates
  # POST /admin/templates.json
  def create
    @template = Template.new(template_params)

    respond_to do |format|
      if @templates.save
        format.html { redirect_to @template , notice: 'Template was successfully created.' }
        format.json { render :show, status: :created, location: @template }
      else
        format.html { render :new }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/templates/1
  # PATCH/PUT /admin/templates/1.json
  def update
    respond_to do |format|
      if @template.update(template_params)
        format.html { redirect_to @template, notice: 'Template was successfully updated.' }
        format.json { render :show, status: :ok, location: @template }
      else
        format.html { render :edit }
        format.json { render json: @template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/templates/1
  # DELETE /admin/templates/1.json
  def destroy
    @template.destroy
    respond_to do |format|
      format.html { redirect_to admin_templates_url, notice: 'Template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template
      @template = Template.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_params
      params.require(:template).permit(:name, :slug, :view_article, :logo)
    end
end

end
