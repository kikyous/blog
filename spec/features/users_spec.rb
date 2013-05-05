require 'spec_helper'

describe User do
  before do
    @user = User.new(username: "Example User",
                     email: "user@example.com",
                     password: "foobar123",
                     password_confirmation: "foobar123")
  end

  subject { @user }

  # 测试@user对象可以回应username方法
  it { should respond_to(:username) }

  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should respond_to(:admin?) }

  # @user对象可以通过有效性验证
  it { should be_valid }

  # 当密码为空的时候@user对象不能通过有效性验证
  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  # 当确认密码和密码不一致时@user对象不能通过有效性验证
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @user.password_confirmation = nil }
    it { should_not be_valid }
  end
end
