class AngelsController < ApplicationController
  # GET /angels
  # GET /angels.xml
  def index
    @angels = Angel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @angels }
    end
  end

  # GET /angels/1
  # GET /angels/1.xml
  def show
    @angel = Angel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @angel }
    end
  end

  # GET /angels/new
  # GET /angels/new.xml
  def new
    @angel = Angel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @angel }
    end
  end

  # GET /angels/1/edit
  def edit
    @angel = Angel.find(params[:id])
  end

  # POST /angels
  # POST /angels.xml
  def create
    @angel = Angel.new(params[:angel])

    respond_to do |format|
      if @angel.save
        format.html { redirect_to(@angel, :notice => 'Angel was successfully created.') }
        format.xml  { render :xml => @angel, :status => :created, :location => @angel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @angel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /angels/1
  # PUT /angels/1.xml
  def update
    @angel = Angel.find(params[:id])

    respond_to do |format|
      if @angel.update_attributes(params[:angel])
        format.html { redirect_to(@angel, :notice => 'Angel was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @angel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /angels/1
  # DELETE /angels/1.xml
  def destroy
    @angel = Angel.find(params[:id])
    @angel.destroy

    respond_to do |format|
      format.html { redirect_to(angels_url) }
      format.xml  { head :ok }
    end
  end
end
