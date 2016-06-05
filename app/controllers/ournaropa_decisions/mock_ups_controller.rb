require_dependency "ournaropa_decisions/application_controller"

module OurnaropaDecisions
  class MockUpsController < ApplicationController

    def index
      @decisions = []
      @decisions << OurnaropaDecisions::Decision.new( :id => 1,
      :author => "Naropa", :title => "ABC", :description => "abcdefghijkl",
      :upvotes => 55, :downvotes => 20, :ends_at => Time.zone.now+16.minutes)
    end

    # shows decision with a given ID
    def show_decision
      @decision = OurnaropaDecisions::Decision.new(
      :id => params[:id],
      :author => "Naropa",
      :title => "Closing the Bike Shack",
      :description => "We are thinking about ",
      :upvotes => 55,
      :downvotes => 20,
      :ends_at => Time.zone.now+16.minutes)
    end

  end
end
