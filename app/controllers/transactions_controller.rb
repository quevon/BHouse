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

  def payment
    # @transactions = Transaction.where( :tenant_id => current_tenant.id)
  end
  
  # def authenticate!
  #   if owner_signed_in?
  #     :authenticate_owner!
  #   elsif tenant_signed_in?
  #     :authenticate_tenant!
  #   end
  # end
  def updatebalance
    update_balance_owner()
    update_balance_tenant()
  end
  def update_balance_owner
    current_owner.update!(balance: current_owner.balance + @transaction.amount)
  end
  def update_balance_tenant
    @transaction.tenant.update!(balance:  @transaction.tenant.balance - @transaction.amount)
  end
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render json: @product, status: :created, location: @transaction }
  
      else
        format.html { render action: "new" }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

    def transaction_params
      params.require(:transaction).permit(:tenant_id, :owner_id, :amount)
    end

 
end
