require 'rails_helper'

feature "SendEmailOnSuccessfulRegistrations", :type => :feature do
  feature "When User successfully registers" do
          
          let(:user) { build(:user)}
          scenario "User count should increment by 1" do
            user_count = User.count
            visit 'signup'
            fill_in "Name", with: user.name
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            fill_in "Password confirmation", with: user.password_confirmation
          
            click_on "Sign Up"
            expect(User.count).to eq(user_count + 1)
          
          end
          
          scenario "Welcome email should be sent" do
          email_sent_count = ActionMailer::Base.deliveries.count
          visit 'signup'
            fill_in "Name", with: user.name
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            fill_in "Password confirmation", with: user.password_confirmation
            
            click_on "Sign Up"
            expect(ActionMailer::Base.deliveries.count).to eq(email_sent_count + 1)
  end
  
  scenario "email with user email should be sent" do
  visit 'signup'
            fill_in "Name", with: user.name
            fill_in "Email", with: user.email
            fill_in "Password", with: user.password
            fill_in "Password confirmation", with: user.password_confirmation
            
            click_on "Sign Up"
            mail = ActionMailer::Base.deliveries.last
            expect(mail['to'].to_s).to eq(user.email)
  
    end
  end
end