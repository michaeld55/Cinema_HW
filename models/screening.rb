class Screening
  attr_accessor( :show_time, :ticket_id )
  attr_reader( :id )

  def initialize( options )

    @id = options['id'].to_i if options['id']
    @show_time = options['show_time']
    @film_id = options['film_id'].to_i

  end

  def save()

    sql = "INSERT INTO screenings
    (
      show_time, film_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@show_time, @film_id]
    film = SqlRunner.run( sql, values ).first()
    @id = film['id'].to_i

  end

  def update

    sql = "UPDATE screenings SET show_time = $1, film_id = $2 WHERE id = $4"
    values = [@show_time, @film_id, @id]
    SqlRunner.run( sql, values )

  end

  def self.find_by_id( id )

    sql = "SELECT * FROM screenings WHERE id = $1"
    values = [id]
    screening = SqlRunner.run( sql, values ).first
    return screening = Screening.new( screening )
  end

  def self.all()

    sql = "SELECT * FROM screenings"
    screenings = SqlRunner.run( sql )
    return screenings = screenings.map { |screening| Screening.new( screening ) }

  end

  def self.delete_all()

    sql = "DELETE FROM screenings"
    SqlRunner.run( sql )

  end

end
