class ConversationsController < ApplicationController
    def index
        @conversations = current_user.mailbox.conversations
    end

    def show
        @conversation = current_user.mailbox.conversations.find(params[:id])
        @conversations = current_user.mailbox.conversations
        @recipient = @conversation.participants.find { |p| p != current_user }
        render 'index'
    end


    def new
        owner = Property.find(params[:property_id]).owner.id
        if current_owner
            @recipients = Tenant.all
        else
            @recipients = owner
        end 
    end

    def create
        if current_owner
            recipient = Tenant.find(params[:owner_id])
        else
            recipient = Owner.find(params[:owner_id])
        end 
        receipt = current_user.send_message(recipient, params[:body], params[:subject])
        redirect_to conversation_path(receipt.conversation)
    end
end