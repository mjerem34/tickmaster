module SpecTestHelper
  def login(user)
    visit signin_path
    fill_in 'session[pseudo]', with: user.pseudo
    fill_in 'session[password]', with: user.password
    click_button 'sendButton'
  end

  def sign_in(user)
    cookies.signed[:remember_token] = [user.id, user.salt]
  end
end
