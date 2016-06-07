module OurnaropaDecisions
  class Notifications < ActionMailer::Base
    default from: "The Cushion <democracy@thecushion.com>"
    layout 'mailer'

    def feedback(feedback)

      @feedback = feedback

      mail(:to => "Finn Woelm <fwoelm@students.naropa.edu>",
      :subject => "[TCDemocracy] New Feedback")
    end
  end
end
