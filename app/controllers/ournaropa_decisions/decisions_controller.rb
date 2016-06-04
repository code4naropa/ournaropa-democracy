require_dependency "ournaropa_decisions/application_controller"

module OurnaropaDecisions
  class DecisionsController < ApplicationController
    before_action :set_decision, only: [:show, :edit, :update, :destroy]

    layout "application"
    
    # GET /decisions
    def index
      @decisions = Decision.all
    end

    # GET /decisions/1
    def show
    end

    # GET /decisions/new
    def new
      @decision = Decision.new
    end

    # GET /decisions/1/edit
    def edit
    end

    # POST /decisions
    def create
      @decision = Decision.new(decision_params)

      if @decision.save
        redirect_to @decision, notice: 'Decision was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /decisions/1
    def update
      if @decision.update(decision_params)
        redirect_to @decision, notice: 'Decision was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /decisions/1
    def destroy
      @decision.destroy
      redirect_to decisions_url, notice: 'Decision was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_decision
        @decision = Decision.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def decision_params
        params.require(:decision).permit(:title, :description, :author)
      end
  end
end
