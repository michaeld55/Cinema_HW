require_relative( "db/sqlrunner.rb" )
require_relative( "models/customer.rb" )
require_relative( "models/film.rb" )
require_relative( "models/ticket.rb" )
require_relative( "models/screening.rb" )

require( "pry-byebug" )

Ticket.delete_all()
Screening.delete_all()
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
screening1 = Screening.new({"show_time" => "18:00", "film_id" => film1.id()})
screening2 = Screening.new({"show_time" => "19:00", "film_id" => film1.id()})
screening3 = Screening.new({"show_time" => "16:00", "film_id" => film2.id()})
screening4 = Screening.new({"show_time" => "18:00", "film_id" => film2.id()})


screening1.save()
screening2.save()
screening3.save()
screening4.save()

# screening1.show_time = "15:00"
# screening1.update

ticket1 = Ticket.new({ "customer_id" => customer1.id(), "screening_id" => screening1.id() })
ticket2 = Ticket.new({ "customer_id" => customer2.id(), "screening_id" => screening2.id() })
ticket3 = Ticket.new({ "customer_id" => customer1.id(), "screening_id" => screening3.id() })
ticket4 = Ticket.new({ "customer_id" => customer1.id(), "screening_id" => screening4.id() })
ticket5 = Ticket.new({ "customer_id" => customer2.id(), "screening_id" => screening2.id() })

ticket1.save()
ticket2.save()
ticket3.save()
ticket4.save()
ticket5.save()

# ticket1.customer_id = customer2.id
# ticket1.update()



binding.pry()
nil
