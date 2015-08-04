require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    #mail = OrderNotifier.received
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation - Order Received!", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
    #assert_equal "Received", mail.subject
    #assert_equal ["to@example.org"], mail.to
    #assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Pragmatic Store Order Confirmation - Order Shipped!", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /1 x Programming Ruby 1.9/, mail.body.encoded
    
    #assert_match /<td>1&times;<\/td>\s*<td>Programming Ruby 1.9<\/td>/, mail.body.encoded


    #mail = OrderNotifier.shipped
    #assert_equal "Shipped", mail.subject
    #assert_equal ["to@example.org"], mail.to
    #assert_equal ["from@example.com"], mail.from
    #assert_match "Hi", mail.body.encoded
  end

end
