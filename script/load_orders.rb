Order.transaction do
  (7..120).each do |i|
    Order.create(id: "#{i}", name: "Mr xx_#{i}", address: "#{i} Main Street \n Alabamha", 
    email: "customer-#{i}@example.com", pay_type: "Credit Card")
  end
end