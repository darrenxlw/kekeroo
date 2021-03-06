class MessagesController < ApplicationController
  #include ActionController::Live
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: :create
  before_action :admin_user,     only: [:destroy, :index]
  after_action :limit_messages, only: :create

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create

    if current_user
      @message = current_user.messages.build(message_params)
    end

    respond_to do |format|
      if @message.save
        format.html { redirect_to :back }
        format.json { render :show, status: :created, location: @message }
      else
        flash.now[:danger] = 'The message could not be sent (please keep the number of characters between 1 and 320).'
        format.html { render 'sessions/new' }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    def limit_messages
      Message.last.delete until Message.count < 80
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:body)
    end

    
end
