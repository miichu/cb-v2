require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
    #tests for the presence of a certain link (url combo)
    test "layout links" do
    get root_path
    assert_template 'pages/home'
    assert_select "a[href=?]", root_path, count: 2 #verifies two such links, navbar and logo
    assert_select "a[href=?]", about_path
    #assert_select "a[href=?]", reviews_path
  end
  
end
