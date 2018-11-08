class Personaje
  attr_accessor :ataque

  def initialize(name)
    @name = name
    @ataque = 1
  end

  def revisar_ataque
    @ataque
  end
end

class PersonajeDecorator < SimpleDelegator
  attr_reader :personaje

  def initialize(personaje)
    @personaje = personaje
  end
end

class ConEspada < PersonajeDecorator
  def revisar_ataque
    @personaje.revisar_ataque + 3
  end
end

class ConDaga < PersonajeDecorator
  def revisar_ataque
    @personaje.revisar_ataque + 1
  end
end

class ConLasers < PersonajeDecorator
  def revisar_ataque
    puts 'It\'s over 9000!'
    @personaje.revisar_ataque + 9000
  end
end

puts 'Normal:'
p = Personaje.new 'Benja'
puts p.revisar_ataque

puts 'Con Espada:'
p_con_espada = ConEspada.new(p)
puts p_con_espada.revisar_ataque

puts 'Sin Espada (Normal):'
p_sin_espada = p_con_espada.personaje
puts p_sin_espada.revisar_ataque

puts 'Con Daga:'
p_con_daga = ConDaga.new(p)
puts p_con_daga.revisar_ataque

puts 'Con Laser:'
p_con_laser = ConLasers.new(p)
puts p_con_laser.revisar_ataque

puts 'Con Espada y Laser:'
p_con_espada_y_laser = ConEspada.new(p_con_laser)
puts p_con_espada_y_laser.revisar_ataque
