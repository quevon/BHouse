class OwnersController < ApplicationController
    def active
        @owner = Owner.find(params[:id])
        if @owner.update approved: true
          OwnerApprovalMailer.with(owner: @owner).ownerapproved.deliver_later
          flash[:success] = "You have been activated #{@owner.email}"
          redirect_to admin_owners_path
        end
      end
    
      def inactive
        @owner = Owner.find(params[:id])
        if @owner.update approved: false
          OwnerInactivateMailer.with(owner: @owner).inactiveowner.deliver_later
          flash[:success] = "You have been deactivated #{@owner.email}"
          redirect_to admin_owners_path
        end
      end
end
