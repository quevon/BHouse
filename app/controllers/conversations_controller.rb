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
            @recipient = Tenant.all
        else
            @recipient = owner
        end 
        
        @receiver = Owner.find(owner)

        @ongoing_conversation = current_user.mailbox.conversations.find_by(subject: Owner.find(owner).name)
        respond_to do |format|
            if @ongoing_conversation.present?
            format.html { redirect_to conversation_url(@ongoing_conversation.id) }
            format.js { redirect_to current_user.mailbox.conversations.find(@ongoing_conversation.id) }
            else
            format.html
            format.js
            end
        end
    end

    def create
        if current_owner
            recipient = Tenant.find(params[:owner_id])
        else
            recipient = Owner.find(params[:owner_id])
        end 
        receipt = current_user.send_message(recipient, params[:body], recipient.name)
        redirect_to conversation_path(receipt.conversation)
    end
end