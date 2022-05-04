class OwnerApprovalMailer < ApplicationMailer
    def ownerapproved
        @owner = params[:owner]
    
        mail(to: @owner.email , subject: "You have been approved by admin!")
    end
end
