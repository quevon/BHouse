class OwnerInactivateMailer < ApplicationMailer
    def inactiveowner
        @owner = params[:owner]
    
        mail(to: @owner.email , subject: "You have been deactivated by admin!")
    end
end
