class TumblrsController < ApplicationController
  # GET /tumblrs
  # GET /tumblrs.json
  def index
    @tumblrs = Tumblr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tumblrs }
    end
  end

  # GET /tumblrs/1
  # GET /tumblrs/1.json
  def show
    @tumblr = Tumblr.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tumblr }
    end
  end

  # GET /tumblrs/new
  # GET /tumblrs/new.json
  def new
    @tumblr = Tumblr.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tumblr }
    end
  end

  # GET /tumblrs/1/edit
  def edit
    @tumblr = Tumblr.find(params[:id])
  end

  # POST /tumblrs
  # POST /tumblrs.json
  def create
    @tumblr = Tumblr.new(params[:tumblr])

    respond_to do |format|
      if @tumblr.save
        format.html { redirect_to @tumblr, notice: 'Tumblr was successfully created.' }
        format.json { render json: @tumblr, status: :created, location: @tumblr }
      else
        format.html { render action: "new" }
        format.json { render json: @tumblr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tumblrs/1
  # PUT /tumblrs/1.json
  def update
    @tumblr = Tumblr.find(params[:id])

    respond_to do |format|
      if @tumblr.update_attributes(params[:tumblr])
        format.html { redirect_to @tumblr, notice: 'Tumblr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tumblr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tumblrs/1
  # DELETE /tumblrs/1.json
  def destroy
    @tumblr = Tumblr.find(params[:id])
    @tumblr.destroy

    respond_to do |format|
      format.html { redirect_to tumblrs_url }
      format.json { head :no_content }
    end
  end
end
