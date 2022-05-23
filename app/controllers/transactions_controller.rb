class TransactionsController < InheritedResources::Base
  def index
    if current_owner
     @transactions = Transaction.where( :owner_id => current_owner.id)
    end
    if current_tenant
       @transactions = Transaction.where( :tenant_id => current_tenant.id)
     end
  end

  def new
    @transaction = Transaction.new
    @property_tenant = PropertyTenant.find(params[:property_tenant_id])
  end

  def edit
    @transaction = Transaction.find(params[:id])
    @property_tenant = @transaction.property_tenant
  end

  def create
    @transaction = Transaction.new(transaction_params)
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
        
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  def payment
    @transaction = Transaction.find(params[:id])
    approve_payment
    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully paid.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { render 'transactions/show' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

    def transaction_params
      params.require(:transaction).permit(:tenant_id, :owner_id, :amount, :property_tenant_id, :status)
    end

 
end
