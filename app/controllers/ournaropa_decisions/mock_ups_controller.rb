require_dependency "ournaropa_decisions/application_controller"

module OurnaropaDecisions
  class MockUpsController < ApplicationController
    before_action :new_feedback

    def submit_feedback
      feedback = Feedback.create(params.require(:feedback).permit(:content, :email, :wants_to_stay_informed))

      # email Finn
      Notifications.feedback(feedback).deliver_later

    end

    def index
      @decisions = [bikeshack, cafe]
    end

    # shows decision with a given ID
    def show_decision
      #@decision
      case params[:id]
        when "1"
          @decision = bikeshack
          init_bikeshack_reasons
          init_bikeshack_alternatives
          init_bikeshack_comments
        when "2"
          @decision = cafe
          init_cafe_reasons
          init_cafe_alternatives
          init_cafe_comments
      end
      @decision.description += "\n...\n..."

    end

    private

    def bikeshack
      return OurnaropaDecisions::Decision.new(
      :id => 1,
      :author => "Naropa",
      :title => "Closing the Bike Shack",
      :description =>
      "The Naropa bike shack was launched two years ago through a grant from" +
      " the department of transportation. It allowed us to hire a bike" +
      " expert" +
      " full-time, who would help students repair their bike and who would" +
      " also run the build-a-bike program. As the grant has now expired," +
      " we are considering to shut down the bike shack." +
      "\n\nHere is more information about the bike shack:" +
      "\n- Operating the bike shack costs $45,000 annually" +
      "\n- Only 15 bikes were built last year using the build-a-bike program",
      :upvotes => 41,
      :downvotes => 63,
      :ends_at => Time.new(2016, 7, 1, 0, 0, 0))
    end

    def init_bikeshack_reasons
      @reasons_for = []
      @reasons_for << OurnaropaDecisions::Reason.new(
      :in_favor => true,
      :text => "The bike shack is too expensive",
      :votes => 93)
      @reasons_for << OurnaropaDecisions::Reason.new(
      :in_favor => true,
      :text => "We could put something else in the space",
      :votes => 13)

      @reasons_against = []
      @reasons_against << OurnaropaDecisions::Reason.new(
      :in_favor => false,
      :text => "I need a place to repair my bike",
      :votes => 102)
      @reasons_against << OurnaropaDecisions::Reason.new(
      :in_favor => false,
      :text => "I want to learn about bike mechanics",
      :votes => 21)
      @reasons_against << OurnaropaDecisions::Reason.new(
      :in_favor => false,
      :text => "I need a rental bike to get to school",
      :votes => 4)
    end

    def init_bikeshack_alternatives
      @alternatives = []
      @alternatives << OurnaropaDecisions::Decision.new(
      :id => 1,
      :author => "Edan",
      :title => "Let Students Run the Bike Shack",
      :description =>
      "Why don't we let students run the bike shack? That reduces costs and" +
      " would even provide additional student employment opportunities. I am" +
      " also willing to volunteer three times a week, if that makes a " +
      " difference.",
      :upvotes => 87,
      :downvotes => 0,
      :created_at => Time.new(2016, 6, 1, 0, 0, 0))
    end

    def init_bikeshack_comments
      @comments = []
      @comments << OurnaropaDecisions::Decision.new(
      :author => "Edan",
      :description =>
      "I bike to school every day and I absolutely rely on the bike shack" +
      " to repair my bike. Don't close it!!",
      :created_at => Time.new(2016, 6, 1, 0, 0, 0))
      @comments << OurnaropaDecisions::Decision.new(
      :author => "Holly",
      :description =>
      "The bike shack has taught me incredibly valuable skills. I have not " +
      " only learned" +
      " how to put together a bike and how to fix a flat tire, but also " +
      " gained a deep understanding for the mechanics of how a bike works." +
      " \n\nThrough that I realized how passionate I am about hands-on," +
      " manual labor and I've just a few months ago started volunteering" +
      " in a bike workshop for children. All of that would never have" +
      " happened without the bike shack.",
      :created_at => Time.new(2016, 6, 1, 0, 0, 0))
      @comments << OurnaropaDecisions::Decision.new(
      :author => "User",
      :description =>
      "SAMPLE // SAMPLE // SAMPLE",
      :created_at => Time.new(2016, 5, 29, 0, 0, 0))
      @comments << OurnaropaDecisions::Decision.new(
      :author => "User",
      :description =>
      "SAMPLE // SAMPLE // SAMPLE",
      :created_at => Time.new(2016, 5, 25, 0, 0, 0))
      @comments << OurnaropaDecisions::Decision.new(
      :author => "User",
      :description =>
      "SAMPLE // SAMPLE // SAMPLE",
      :created_at => Time.new(2016, 5, 24, 0, 0, 0))
      @comments << OurnaropaDecisions::Decision.new(
      :author => "User",
      :description =>
      "SAMPLE // SAMPLE // SAMPLE",
      :created_at => Time.new(2016, 5, 19, 0, 0, 0))
    end

    def cafe
      return OurnaropaDecisions::Decision.new(
      :id => 2,
      :author => "Naropa",
      :title => "New Naropa Cafe partner: Commmunity Table Kitchens",
      :description =>
      "For twenty years we have worked together with Three Leaf Farms to" +
      " operate the Naropa cafe. We are very grateful for this partnership. " +
      "\n\nOn December 31, this partnership with Three Leaf Farms will come" +
      " to an end. And so we have had multiple conversations with" +
      " <a target='_blank' href='http://boulderbridgehouse.org/what-we-do/" +
      "community-table-kitchen/' class='link'>Community Table Kitchens</a>" +
      " - a non-profit organizations that gives" +
      " people a second chance by providing them with housing and training" +
      " them to be chefs. Would you like them to run our cafe?" +
      "\n\nWhat else this would mean:" +
      "\n- More transparency because Community Table Kitchens will share" +
      " their metrics with us",
      :upvotes => 212,
      :downvotes => 3,
      :ends_at => Time.new(2016, 8, 31, 0, 0, 0))
    end

    def init_cafe_reasons
      @reasons_for = []
      @reasons_for << OurnaropaDecisions::Reason.new(
      :in_favor => true,
      :text => "I like supporting non-profits",
      :votes => 108)
      @reasons_for << OurnaropaDecisions::Reason.new(
      :in_favor => true,
      :text => "Transparency matters to me",
      :votes => 78)
      @reasons_for << OurnaropaDecisions::Reason.new(
      :in_favor => true,
      :text => "...",
      :votes => 23)

      @reasons_against = []
    end

    def init_cafe_alternatives
      @alternatives = []
    end

    def init_cafe_comments
      @comments = []
      @comments << OurnaropaDecisions::Decision.new(
      :author => "User",
      :description =>
      "SAMPLE // SAMPLE // SAMPLE",
      :created_at => Time.new(2016, 5, 29, 0, 0, 0))
      @comments << OurnaropaDecisions::Decision.new(
      :author => "User",
      :description =>
      "SAMPLE // SAMPLE // SAMPLE",
      :created_at => Time.new(2016, 5, 25, 0, 0, 0))
      @comments << OurnaropaDecisions::Decision.new(
      :author => "User",
      :description =>
      "SAMPLE // SAMPLE // SAMPLE",
      :created_at => Time.new(2016, 5, 24, 0, 0, 0))
      @comments << OurnaropaDecisions::Decision.new(
      :author => "User",
      :description =>
      "SAMPLE // SAMPLE // SAMPLE",
      :created_at => Time.new(2016, 5, 19, 0, 0, 0))
    end

    def new_feedback
      @feedback = Feedback.new
    end

  end
end
