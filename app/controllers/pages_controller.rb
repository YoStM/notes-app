class PagesController < ApplicationController
  before_action :set_notebook
  before_action :set_page, only: %i[ show edit update destroy ]

  # GET /pages/1 or /pages/1.json
  def show
  end

  # GET /pages/new
  def new
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
  end

  # POST /pages or /pages.json
  def create
    @page = @notebook.pages.build(page_params)

    @page.position = @notebook.get_next_page_position

    if @page.save
      redirect_to notebook_page_path(@notebook, @page), notice: "Page was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1 or /pages/1.json
  def update
    if @page.update(page_params)
      redirect_to notebook_page_path(@notebook, @page), notice: "Page was successfully created."
    else
      render :edit
    end
  end

  # DELETE /pages/1 or /pages/1.json
  def destroy
    @page.destroy
      redirect_to @notebook, notice: "Page was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = current_user.notebooks.find(params[:notebook_id])
    end
    # Scoping the page to the notebook
    def set_page
      @page = @notebook.pages.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title)
    end
end
