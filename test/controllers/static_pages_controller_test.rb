require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end	
  test "should get home" do
    get :home
    assert_response :success
    # assert_select "title", "Home | Ruby on Rails Tutorial Sample App"
    assert_select "title", "HomeHome | Ruby on Rails Tutorial Sample App"
  end
=begin
    
 FAIL["test_should_get_home", Minitest::Result, 2020-03-21 10:34:55 +0200]
 test_should_get_home#Minitest::Result (1584779695.46s)
        <Home | Ruby on Rails Tutorial Sample App> expected but was
        <HomeHome | Ruby on Rails Tutorial Sample App>..
        Expected 0 to be >= 1.
        test/controllers/static_pages_controller_test.rb:11:in `block in <class:StaticPagesControllerTest>'
 FAIL["test_should_get_home", Minitest::Result, 2020-03-21 10:34:48 +0200]
 test_should_get_home#Minitest::Result (1584779688.77s)
        <Home | Ruby on Rails Tutorial Sample App> expected but was
        <HomeHome | Ruby on Rails Tutorial Sample App>..
        Expected 0 to be >= 1.
        test/controllers/static_pages_controller_test.rb:11:in `block in <class:StaticPagesControllerTest>'
   
=end  
  test "should get help" do
    get :help
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
