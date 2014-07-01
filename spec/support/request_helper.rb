module RequestHelper
  extend ActiveSupport::Concern
 
  included do
    metadata[:js] = true
  end
 
  def sign_in(user)
    visit "/users/sign_in"
 
    fill_in I18n.t("sessions.new.email"), :with => user.email
    fill_in I18n.t("sessions.new.password"), :with => user.password
    click_button I18n.t("sessions.new.sign_in")
  end
 
  def reload_page
    visit current_path
  end
 
  def within_header
    within "#header" do
      yield
    end
  end
 
  def within_overlay
    within "#overlay" do
      yield
    end
  end
 
  def expect_path(path)
    wait_until { current_path == path }
    current_path.should == path
  rescue Capybara::TimeoutError
    flunk "Waiting for current path to equal #{path}, Timed out."
  end
end
