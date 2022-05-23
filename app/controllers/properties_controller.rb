class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy add_like remove_like]

  # GET /properties or /properties.json
  def index
    if current_owner
      @properties = current_owner.properties
    else
      @radius = params[:new_radius] ? params[:new_radius] : 50
      if !params[:property].nil? 
        session[:origin_point] = [(params[:property][:location_lat]).to_f,(params[:property][:location_lng]).to_f]
        @q = Property.within(@radius, :origin => session[:origin_point]).where(:availability => true).ransack(params[:q])
        @properties = @q.result(distinct: true)
      elsif params[:property].nil? && !session[:origin_point].nil?
        @q = Property.within(@radius, :origin => session[:origin_point]).where(:availability => true).ransack(params[:q])
        @properties = @q.result(distinct: true)
      else
        @q = Property.ransack(params[:q])
        @properties = @q.result(distinct: true)
      end
    end
  end

  # GET /properties/1 or /properties/1.json
  def show
    @property.property_tenants.build
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit; end

  # GET /properties/liked
  def liked
    if current_tenant.likes.count > 0
      @q = current_tenant.liked_properties
      @properties = @q
      render 'properties/index'
    else
      respond_to do |format|
        format.html { redirect_to properties_path, notice: 'Select one of these properties to add to your liked collection.' }
        format.json { render :show, status: :created, location: @property }
      end
    end
  end

  # POST /properties or /properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to property_url(@property), notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1 or /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to property_url(@property), notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1 or /properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clear_origin_point
    @clear = session[:origin_point] = nil
    redirect_to properties_url
  end

  def add_like
    Like.create(:tenant_id => current_tenant.id, :property_id => @property.id)
    redirect_to property_path(@property)
  end

  def remove_like
    @property.likes.first.destroy
    redirect_to property_path(@property)
  end
  

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_params
    params.require(:property).permit(:search, :availability, :slots, :owner_id, :approved, :property_type, :listing_type,  :monthly_price,
                                     :deposit_advance, :deposit_security, :other_fees, 
                                     :location_city, :location_lat, :location_lng, :long_address, :image,
                                     :accomodation_type=>[], :amenities=>[], :house_rules=>[],
                                     property_tenant_attributes:[:id, :property_id, :tenant_id, :status, :_destroy])
  end
end
