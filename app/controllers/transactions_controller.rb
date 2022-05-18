class TransactionsController < InheritedResources::Base
  before_action :authenticate_tenant!
  # before_action :set_transaction, only: %i[ show edit update destroy ]

  def index
    @transactions = Transaction.where( :tenant_id => current_tenant.id)
  end

  # def new
  #   @transaction = @tenant.prescriptions.build
  # end
  def update_balance_owner
    # @owner = Owner.find(params[:id])
    @owner.balance_update!(balance: @owner.balance + @transaction.amount)
  end
  def update_balance_tenant
    current_tenant.update!(balance: current_tenant.balance - @transaction.amount)
  end
  # GET /prescriptions/1/edit
  # def edit
  # end
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
  # POST /prescriptions or /prescriptions.json
  # def create
  #   @transaction = @tenant.prescriptions.build(transaction_params)

  #   respond_to do |format|
  #     if @transaction.save
  #       format.html { redirect_to doctor_prescriptions_path(@tenant), notice: "Prescription was successfully created." }
  #       format.json { render :show, status: :created, location: @transaction}
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @transaction.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  
  private

    def transaction_params
      params.require(:transaction).permit(:tenant_id, :owner_id, :amount)
    end

    # def set_transaction
    #   @transaction = @tenant.prescriptions.find(params[:id])
    # end

    # def get_owner
    #   @owner = Owner.find(params[:id])
    # end


end
