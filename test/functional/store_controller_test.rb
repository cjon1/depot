require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    #assert_select '.price', /\£[,\d]+\.\d\d/ # - this test is illegal - it hates the £ symbol as not part of standard US-ASCII table
    assert_select '.price', /\$[,\d]+\.\d\d/ # - this test would work if I hadn't changed my currency to Pounds
  end
  
  test "markup needed for store.js.coffee is in place" do
    get :index
    assert_select '.store .entry > img', 3
    assert_select '.entry input[type=submit]', 3
  end
end
