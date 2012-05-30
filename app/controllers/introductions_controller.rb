class IntroductionsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index] 
  
  # GET /introductions
  # GET /introductions.json
  def index
    @introductions = Introduction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @introductions }
    end
  end

  # GET /introductions/1
  # GET /introductions/1.json
  def show
    @introduction = Introduction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @introduction }
    end
  end

  # GET /introductions/new
  # GET /introductions/new.json
  def new
    @introduction = Introduction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @introduction }
    end
  end

  # GET /introductions/1/edit
  def edit
    @introduction = Introduction.find(params[:id])
  end

  # POST /introductions
  # POST /introductions.json
  def create
    @introduction = Introduction.new(params[:introduction])

    respond_to do |format|
      if @introduction.save
        format.html { redirect_to @introduction, notice: 'Introduction was successfully created.' }
        format.json { render json: @introduction, status: :created, location: @introduction }
      else
        format.html { render action: "new" }
        format.json { render json: @introduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /introductions/1
  # PUT /introductions/1.json
  def update
    @introduction = Introduction.find(params[:id])

    respond_to do |format|
      if @introduction.update_attributes(params[:introduction])
        format.html { redirect_to @introduction, notice: 'Introduction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @introduction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /introductions/1
  # DELETE /introductions/1.json
  def destroy
    @introduction = Introduction.find(params[:id])
    @introduction.destroy

    respond_to do |format|
      format.html { redirect_to introductions_url }
      format.json { head :no_content }
    end
  end
end
