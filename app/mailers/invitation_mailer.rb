class InvitationMailer < ApplicationMailer
    def send_invitation(user)
        @user = user
        mail(to: user.email, subject: 'Invitation to join')
    end
end
