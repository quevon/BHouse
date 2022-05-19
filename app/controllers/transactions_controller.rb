class TransactionsController < InheritedResources::Base
  before_action :authenticate_owner!

  def index
    @transactions = Transaction.where( :owner_id => current_owner.id)
  end

  # def authenticate!
  #   if owner_signed_in?
  #     :authenticate_owner!, :except => 
  #   elsif tenant_signed_in?
  #     :authenticate_tenant!
  #   end
  # end
  def tenant_signed_in?
    tenant_signed_in?
  end
  def tenant
    # @transactions = Transaction.where( :tenant_id => current_tenant.id)
  end

  def update_balance_owner
    @transaction.owner.update!(balance: @transaction.owner.balance + @transaction.amount)
  end
  def update_balance_tenant
    current_tenant.update!(balance: current_tenant.balance - @transaction.amount)
  end

  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render json: @product, status: :created, location: @transaction }
        update_balance_tenant()
        update_balance_owner()
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
