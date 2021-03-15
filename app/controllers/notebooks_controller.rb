class NotebooksController < ApplicationController
  before_action :authenticate_user! # Redirect to root_path if user is not logged in
  before_action :set_notebook, only: %i[ show edit update destroy ]

  # GET /notebooks or /notebooks.json
  def index
    # Changed from Notebook.all to the following for security reason
    @notebooks = current_user.notebooks
  end

  # GET /notebooks/1 or /notebooks/1.json
  def show
  end

  # GET /notebooks/new
  def new
    @notebook = Notebook.new
  end

  # GET /notebooks/1/edit
  def edit
  end

  # POST /notebooks or /notebooks.json
  def create
    @notebook = current_user.notebooks.build(notebook_params)

    respond_to do |format|
      if @notebook.save
        format.html { redirect_to @notebook, notice: "Notebook was successfully created." }
        format.json { render :show, status: :created, location: @notebook }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notebooks/1 or /notebooks/1.json
  def update
    respond_to do |format|
      if @notebook.update(notebook_params)
        format.html { redirect_to @notebook, notice: "Notebook was successfully updated." }
        format.json { render :show, status: :ok, location: @notebook }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notebooks/1 or /notebooks/1.json
  def destroy
    @notebook.destroy
    respond_to do |format|
      format.html { redirect_to notebooks_url, notice: "Notebook was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      # changed from Notebooks.find(params:[id]) to the following for security reason
      @notebook = current_user.notebooks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notebook_params
      # Removed second "permit" params for security reason, so that we can't access user_id from the URL
      # Now we can't play aroudn anymore with the URL
      params.require(:notebook).permit(:title)
    end
end
