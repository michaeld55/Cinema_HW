require_relative( "models/customer.rb" )
require_relative( "models/film.rb" )
require_relative( "models/ticket.rb" )

require( "pry-byebug" )

# Ticket.delete_all()
Customer.delete_all()
# Film.delete_all()

customer1 = Customer.new({ "name" => "Bob McJoe", "funds" => 2000})
customer1.save()

customer1.name = "Joe McBob"
customer1.update()


binding.pry()
nil
