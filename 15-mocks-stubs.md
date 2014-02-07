Mocks and Stubs
===============

Mockist vs. Classical
---------------------

BDD compared to TDD

Mock API
--------

    mock = MiniTest::Mock.new
    mock.expect :to_s, "o hai"
    PrinterDisplay.new mock
    mock.verify # We expect that to_s was called

Stub API
--------

    Time.stub :now, 0 do
      puts Time.now # 0
    end
    Time.now # current time

Mocks vs. Doubles
-----------------

    mike = OpenStruct.new name: "Mike Moore", email: "mike@example.com"
    puts "#{mike.name} <#{mike.email}>"
    mike = Person.new name: "Mike Moore", email: "mike@example.com"
    puts "#{mike.name} <#{mike.email}>"

Mocha
-----

    product = Product.new
    product.expects(:save).returns(true)
    assert product.save

    product = Product.new
    product.stubs(:save).returns(true)
    assert product.save

Ruby
----

    product = Product.new
    def product.save
      true
    end

Isolation via Mocks vs. Isolation via Design

Where can we use mocks in our code so far?
