class CrimesController < ApplicationController
  # GET /crimes
  # GET /crimes.json
  def index
    @crimes = Crime.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @crimes }
    end
    
  end

  # GET /crimes/1
  # GET /crimes/1.json
  def show
    
    @lat = cookies[:lat]
    @long = cookies[:long]
    
    @crime = Crime.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @crime }
    end
  end

  # GET /crimes/new
  # GET /crimes/new.json
  def new
    @crime = Crime.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @crime }
    end
  end

  # GET /crimes/1/edit
  def edit
    @crime = Crime.find(params[:id])
  end

  # POST /crimes
  # POST /crimes.json
  def create
    @crime = Crime.new(params[:crime])

    respond_to do |format|
      if @crime.save
        format.html { redirect_to @crime, notice: 'Crime was successfully created.' }
        format.json { render json: @crime, status: :created, location: @crime }
      else
        format.html { render action: "new" }
        format.json { render json: @crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /crimes/1
  # PUT /crimes/1.json
  def update
    @crime = Crime.find(params[:id])

    respond_to do |format|
      if @crime.update_attributes(params[:crime])
        format.html { redirect_to @crime, notice: 'Crime was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @crime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crimes/1
  # DELETE /crimes/1.json
  def destroy
    @crime = Crime.find(params[:id])
    @crime.destroy

    respond_to do |format|
      format.html { redirect_to crimes_url }
      format.json { head :no_content }
    end
  end
  
  def show_threat
    
    if params[:radius].to_i <= 2
      @radius = params[:radius]
    else
      redirect_to front_page_path, :flash => { :error => "Radius cannot be greater than 2 miles" }
      return
    end
    
    
    @lat = cookies[:lat].to_f
    @long = cookies[:long].to_f
    
    @crimes = Crime.near("#{@lat},#{@long}",@radius,:order => :distance)
  
  end
  
  def front_page
    
  end
  
end
