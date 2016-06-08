module OurnaropaDecisions
  class Decision < ActiveRecord::Base
    attr_accessor :upvotes, :downvotes, :ends_at, :reasons_for, :reasons_against

  end
end
