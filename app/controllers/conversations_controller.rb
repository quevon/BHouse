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
        if current_owner
            @recipients = Tenant.all
        else
            @recipients = Owner.all
        end 

        # @conversation = current_user.mailbox.conversations.find(Property.first.owner_id)
        # @ongoing_conversation = current_user.mailbox.conversations.find(params[:id])

        # if current_owner
        #     @recipient = Tenant.find(params[:recipient])
        # else
        #     @recipient = Owner.find(params[:recipient])
        # end 
        # @recipient = @property.owner_id
        # @ongoing_conversation = Conversation.participant(current_user).participant(@recipient)

        # respond_to do |format|
        #     format.html { redirect_to root_path }
        #     if @ongoing_conversation.present?
        #         format.js { redirect_to mailbox.conversations.find(@ongoing_conversation) }
        #     else
        #         format.js
        #     end
        # end
    end

    def create
        if current_owner
            recipient = Tenant.find(params[:owner_id])
        else
            recipient = Owner.find(params[:owner_id])
        end 
        receipt = current_user.send_message(recipient, params[:body], "subject")
        redirect_to conversation_path(receipt.conversation)
    end
end