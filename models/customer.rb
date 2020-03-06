require_relative("../db/sqlrunner.rb")
require_relative("film.rb")
require_relative("ticket.rb")

class Customer

  attr_reader( :id )
  attr_accessor( :name, :funds )

  def initialize( options )

    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"].to_i()

  end

  def save()

    sql = "INSERT INTO customers
    (
      name, funds
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run( sql, values ).first()
    @id = customer['id'].to_i

  end

  def update
    sql = "UPDATE customers SET name = $1, funds = $2 WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run( sql, values )
  end

  def films
    sql ="SELECT * FROM films INNER JOIN tickets ON tickets.film_id = films.id  WHERE customer_id = $1"
   values = [@id]
   films = SqlRunner.run( sql,values )
   return films = films.map {|film| Film.new( film )}

  end

  def self.find_all()

    sql = "SELECT * FROM customers"
    customers = SqlRunner.run( sql )
    return customers = customers.map { |customer| Customer.new( customer ) }
  end

  def self.delete_all()

    sql = "DELETE FROM customers"
    SqlRunner.run( sql )

  end

end
