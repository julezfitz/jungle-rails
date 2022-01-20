require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it "validates user password fields are present" do
      @user = User.new({
        :first_name => "Test", 
        :last_name => "Tester", 
        :email => "example@email.com",
      })
      @user.save;
      
      expect(@user.errors.full_messages).to include ('Password can\'t be blank')
    end

    it "validates user password and confirmation field match" do
      @user = User.new({
        :first_name => "Test", 
        :last_name => "Tester", 
        :email => "example@email.com",
        :password => "password", 
        :password_confirmation => "passw0rd"
      })
      @user.save;
      
      expect(@user.errors.full_messages).to include ('Password confirmation doesn\'t match Password')
    end

    it "validates user password and confirmation fields are both present" do
      @user = User.new({
        :first_name => "Test", 
        :last_name => "Tester", 
        :email => "example@email.com",
        :password => "password", 
        :password_confirmation => ""
      })
      @user.save
      
      p @user.errors
      expect(@user.errors.full_messages).to include ('Password confirmation can\'t be blank')
    end

    it "validates user email must be unique" do
      @user = User.new({
        :first_name => "Test", 
        :last_name => "Tester", 
        :email => "example@email.com",
        :password => "password",
        :password_confirmation => "password" 
      })
      @user.save

      @user2 = User.new({
        :first_name => "Me", 
        :last_name => "McTester", 
        :email => "example@EMAIL.com",
        :password => "password",
        :password_confirmation => "password" 
      })
      @user2.save

      expect(@user2.errors.full_messages).to include ('Email has already been taken')
    end

    it "validates email, first name, and last name are present" do
      @user = User.new({
        :password => "password",
        :password_confirmation => "password" 
      })
      @user.save

      expect(@user.errors.full_messages).to include ('Email can\'t be blank')
      expect(@user.errors.full_messages).to include ('First name can\'t be blank')
      expect(@user.errors.full_messages).to include ('Last name can\'t be blank')
    end

    it "validates password minimum length" do
      @user = User.new({
        :first_name => "Me", 
        :last_name => "McTester", 
        :email => "example@EMAIL.com",
        :password => "pass",
        :password_confirmation => "pass" 
      })
      @user.save

      expect(@user.errors.full_messages).to include ('Password is too short (minimum is 5 characters)')
    end

  end 

  describe '.authenticate_with_credentials' do
    it "returns a user object when email is present and password is correct" do
      User.create({
        :first_name => "Me", 
        :last_name => "McTester", 
        :email => "example@EMAIL.com",
        :password => "password",
        :password_confirmation => "password" 
      })

      @user = User.authenticate_with_credentials("example@EMAIL.com", "password")
      expect(@user).to be_a User
  end

  it "returns nil when email parameter is not present" do
   
    @user = User.authenticate_with_credentials("", "password")
    expect(@user).to be_nil
  end

  it "returns nil when email is not present in database" do
   
    @user = User.authenticate_with_credentials("email@does-not-exist.com", "password")
    expect(@user).to be_nil
  end

  it "returns nil when email is present and password is incorrect" do
    User.create({
      :first_name => "Me", 
      :last_name => "McTester", 
      :email => "example@EMAIL.com",
      :password => "password",
      :password_confirmation => "password" 
    })

    @user = User.authenticate_with_credentials("example@EMAIL.com", "wrong-password")
    expect(@user).to be_nil
  end

  it "returns a user object when email has additional spaces" do
    User.create({
      :first_name => "Me", 
      :last_name => "McTester", 
      :email => "example@EMAIL.com",
      :password => "password",
      :password_confirmation => "password" 
    })

    @user = User.authenticate_with_credentials("  example@EMAIL.com  ", "password")
    expect(@user).to be_a User
end

it "returns a user object when email has other cased letters" do
  User.create({
    :first_name => "Me", 
    :last_name => "McTester", 
    :email => "example@EMAIL.com",
    :password => "password",
    :password_confirmation => "password" 
  })

  @user = User.authenticate_with_credentials("example@email.com", "password")
  expect(@user).to be_a User
end

end

end



