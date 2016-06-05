require_dependency "ournaropa_decisions/application_controller"

module OurnaropaDecisions
  class MockUpsController < ApplicationController

    def index
      @decisions = [bikeshack, cafe]
    end

    # shows decision with a given ID
    def show_decision
      #@decision
      case params[:id]
        when "1"
          @decision = bikeshack
        when "2"
          @decision = cafe
      end
      @decision.description += "\n...\n...\n\n<b>Disclaimer: This is sample text - I" +
      " do not know actual details.</b>"
      init_bikeshack_reasons
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

  end
end
