module OurnaropaDecisions
  class Reason < ActiveRecord::Base
    attr_accessor :votes, :text, :in_favor

  end
end
