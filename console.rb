require_relative( "db/sqlrunner.rb" )
require_relative( "models/customer.rb" )
require_relative( "models/film.rb" )
require_relative( "models/ticket.rb" )

require( "pry-byebug" )

Ticket.delete_all()
Customer.delete_all()
Film.delete_all()

customer1 = Customer.new({ "name" => "Bob McJoe", "funds" => 2000})
customer2 = Customer.new({ "name" => "Joe McBob", "funds" => 3000})
customer1.save()
customer2.save()

# customer1.name = "Joe McBob"
# customer1.update()


film1 = Film.new({ "title" => "Big Movie", "price" => 20})
film2 = Film.new({ "title" => "Small Movie", "price" => 30})
film1.save()
film2.save()

# film1.title = "Small Movie"
# film1.update()

ticket1 = Ticket.new({ "customer_id" => customer1.id(), "film_id" => film1.id() })
ticket2 = Ticket.new({ "customer_id" => customer2.id(), "film_id" => film2.id() })
ticket1.save()
ticket2.save()


# ticket1.customer_id = customer2.id
# ticket1.update()

binding.pry()
nil
