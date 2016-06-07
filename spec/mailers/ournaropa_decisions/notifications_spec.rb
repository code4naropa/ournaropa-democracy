require "rails_helper"

module OurnaropaDecisions
  RSpec.describe Notifications, type: :mailer do
    describe "feedback" do
      let(:mail) { Notifications.feedback }

      it "renders the headers" do
        expect(mail.subject).to eq("Feedback")
        expect(mail.to).to eq(["to@example.org"])
        expect(mail.from).to eq(["from@example.com"])
      end

      it "renders the body" do
        expect(mail.body.encoded).to match("Hi")
      end
    end

  end
end
