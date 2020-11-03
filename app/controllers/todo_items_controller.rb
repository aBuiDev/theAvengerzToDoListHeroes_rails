class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [:show, :edit, :update, :destroy]

  # GET /todo_items
  # GET /todo_items.json
  def index
    @todo_items = TodoItems.all
  end

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
    @todo_items = TodoItems.find(params[:id])
  end

  # GET /todo_items/new
  def new
    @todo_item = TodoItems.new
  end

  # GET /todo_items/1/edit
  def edit
  end

  # POST /todo_items
  # POST /todo_items.json
  def create
    @todo_item = TodoItems.new(todo_item_params)

    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to @todo_item, notice: 'todo_item was successfully created.' }
        format.json { render :show, status: :created, location: @todo_item }
      else
        format.html { render :new }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to @todo_item, notice: 'todo_item was successfully updated.' }
        format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to todo_items_url, notice: 'todo_item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_item = todo_item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_item_params
      params.require(:todo_item).permit(:content, :todo_list_id)
    end
end
