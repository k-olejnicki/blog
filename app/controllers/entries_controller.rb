class EntriesController < ApplicationController
  before_action :require_user, only: [:index, :show]
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    if params[:search]
      @entries = Entry.search(params[:search]).order("created_at DESC")
      else
    if params[:category]
      @entries = Entry.where(:category => params[:category])
      flash[:notice] = "There are <b>#{@entries.count}</b> in this category".html_safe
    else
      @entries = Entry.all.order("created_at DESC") && Entry.where(["date <= ?" , Date.today])
    end
    end
  end
  def random_items(array)
    array.sample(1 + rand(array.count))
  end
  # GET /entries/1
  # GET /entries/1.json
  def show
    @entry = Entry.find(params["id"])
  end
  # GET /entries/new
  def new
    @entry = Entry.new
  end
  def category
    @entry = Entry.find(params["category"])
  end
  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params["id"])
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to @entry, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to @entry, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def date
    time = Time.new

    values = time.to_a
    puts Time.utc(*values)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:id, :title, :date, :contents, :image, :youtube_url, :youtube_embed, :nick, :category, :user_id, :image_file_name)
    end
end
