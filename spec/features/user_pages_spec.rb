require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup" do
    before { visit new_user_registration_path }

    it { should have_selector('label', text: 'Email') }
    it { should have_selector('label', text: 'Password') }
    it { should have_selector('label', text: 'Password confirmation') }

    let(:submit) { "Sign Up" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_username",              with: "Example User"
        fill_in "user_email",                 with: "user@example.com"
        fill_in "user_password",              with: "foobar123"
        fill_in "user_password_confirmation", with: "foobar123"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end

  describe "signin" do
    before { visit new_user_session_path }

    it { should have_selector('label', text: 'Email') }
    it { should have_selector('label', text: 'Password') }
    it { should have_selector('label', text: 'Remember me') }

    describe "with valid information" do
      it "should sign in faile" do
        click_button 'Sign in'
        should have_selector('div', text: 'Invalid email or password.')
      end
    end

    describe "with valid information" do
      before do
        @user = User.new(username: "Example User",
                         email: "user@example.com",
                         password: "foobar123",
                         password_confirmation: "foobar123")
        @user.save

        fill_in "user_email",                 with: "user@example.com"
        fill_in "user_password",              with: "foobar123"
      end

      it "should sign in success" do
        click_button 'Sign in'
        should have_selector('div', text: 'Signed in successfully.')
      end
    end
  end
end
