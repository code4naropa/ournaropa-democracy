module OurnaropaDecisions
  class Decision < ActiveRecord::Base
    attr_accessor :upvotes, :downvotes, :ends_at
  end
end
