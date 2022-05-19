class PropertyTenantsController < ApplicationController
    def create
        @property_tenant = PropertyTenant.new(property_tenant_params)
        respond_to do |format|
            if @property_tenant.save
              format.html { redirect_to property_url(@property_tenant.property), notice: 'Successfully applied as tenant to this property.' }
            else
              format.html { redirect_to property_url(@property_tenant.property), notice: 'Application was not successfully created.' }
            end
          end
    end

    def update
      @property_tenant = PropertyTenant.find(params[:property_tenant][:id])
      case params[:property_tenant][:status] 
      when "approved"
        if @property_tenant.property.slots > 0 
          @property_tenant.property.update(:slots => @property_tenant.property.slots - 1)
          PropertyTenant.where(:tenant_id => @property_tenant.tenant.id).each  {|item| item.update(:status => "cancelled")}
          @property_tenant.status = "approved"
          @property_tenant.property.update(:availability => @property_tenant.property.slots == 0 ? false : true)
        end
      else
        @property_tenant.status = params[:property_tenant][:status] 
      end
      respond_to do |format|
          if @property_tenant.update(property_tenant_params)
            format.html { redirect_to property_url(@property_tenant.property), notice: 'Application Status Updated' }
          else
            format.html { redirect_to property_url(@property_tenant.property), notice: 'Error' }
          end
        end
    end

    private

    def property_tenant_params
        params.require(:property_tenant).permit(:property_id, :tenant_id, :status)
    end

end
