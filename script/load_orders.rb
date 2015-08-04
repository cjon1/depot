Order.transaction do
  (121..150).each do |i|
    Order.create(id: "#{i}", name: "Mr xy_#{i}", address: "#{i} Mainline Street \n Alabamha", 
    email: "customer-#{i}@aol.com", pay_type: "Debit Card")
  end
end
