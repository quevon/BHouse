class TransactionsController < InheritedResources::Base
    # before_action :authenticate_tenant!,only: [:payment]
  # before_action :authenticate!
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
    respond_to do |format|
      if @transaction.update_balance
        format.html { redirect_to @transaction, notice: 'Transaction was successfully paid.' }
        format.json { render json: @transaction, status: :created, location: @transaction }
      else
        format.html { redirect_to @transaction }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

    def transaction_params
      params.require(:transaction).permit(:tenant_id, :owner_id, :amount, :property_tenant_id, :status)
    end

 
end
