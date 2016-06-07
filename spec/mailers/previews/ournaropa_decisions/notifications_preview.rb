module OurnaropaDecisions
  # Preview all emails at http://localhost:3000/rails/mailers/ournaropa_decisions/notifications
  class NotificationsPreview < ActionMailer::Preview

    # Preview this email at http://localhost:3000/rails/mailers/ournaropa_decisions/notifications/feedback
    def feedback
      Notifications.feedback
    end

  end
end
