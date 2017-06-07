module SpecTestHelper
  def login(user)
    expect(user).not_to be_nil
    session = UserSession.create!(email: user.email, password: user.password)
    expect(session).to be_valid
    session.save
  end

  def logout(user)
    expect(user).not_to be_nil
    session = UserSession.find(email: user.email, password: user.password)
    expect(session).to be_valid
    session.destroy
  end
end
