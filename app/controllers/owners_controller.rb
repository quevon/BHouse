class OwnersController < ApplicationController
    def active
        @owner = Owner.find(params[:id])
        if @owner.update approved: true
        #   UserApprovalEmailMailer.with(user: @user).userapproved.deliver_later
          flash[:success] = "You have been activated #{@owner.email}"
          redirect_to admin_owners_path
        end
      end
    
      def inactive
        @owner = Owner.find(params[:id])
        if @owner.update approved: false
        #   InactivateUserMailer.with(user: @user).inactiveuser.deliver_later
          flash[:success] = "You have been deactivated #{@owner.email}"
          redirect_to admin_owners_path
        end
      end
end
