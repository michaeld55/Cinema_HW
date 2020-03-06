require_relative("../db/sqlrunner.rb")
require_relative("film.rb")
require_relative("ticket.rb")

class Film

  attr_reader( :id )
  attr_accessor( :title, :price )

  def initialize( options )

    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"].to_i()

  end

  def save()

    sql = "INSERT INTO films
    (
      title, price
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @price]
    film = SqlRunner.run( sql, values ).first()
    @id = film['id'].to_i

  end

  def update
    sql = "UPDATE films SET title = $1, price = $2 WHERE id = $3"
    values = [@title, @price, @id]
    SqlRunner.run( sql, values )

  end

  def customers
    sql ="SELECT * FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id  WHERE film_id = $1"
   values = [@id]
   customers = SqlRunner.run( sql,values )
   return customers = customers.map {|customer| Customer.new( customer )}

  end

  def self.find_all()

    sql = "SELECT * FROM films"
    films = SqlRunner.run( sql )
    return films = films.map { |film| Film.new( film ) }

  end

  def self.delete_all()

    sql = "DELETE FROM films"
    SqlRunner.run( sql )

  end

end
