class TenantsController < ApplicationController
  def add_balance
    current_tenant.balance += 20000
    respond_to do |format|
      if current_tenant.save
        format.html { redirect_to root_path, notice: 'Funds received.' }
      end
    end
  end
end
