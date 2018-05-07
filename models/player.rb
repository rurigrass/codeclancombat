require_relative('../db/sql_runner')

class Player
  attr_reader :id
  attr_accessor :name, :strength, :ability

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @strength = options['strength'].to_i
    @ability = options['ability'].to_i
  end

  def power()
    @strength + @ability
  end


end
