class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :cages, :employees
  def initialize (name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    @employees = []
    10.times do
      @cages << Cage.new
    end
  end
  def add_employee (employee)
    @employees << employee
  end

  def open?(date)
    date >= @season_opening_date && date < @season_closing_date
  end
  def add_animal(new_animal)
    @cages.each do |cage|
      if cage.empty?
        cage.animal = new_animal
        return
      end
    end
    raise ZooAtCapacity
  end
  def visit
    output = ""
    @employees.each do |employee|
      output += "#{employee.greet}\n"
    end
    @cages.each do |cage|
      if !cage.empty?
        output += "#{cage.animal.speak}\n"
      end
    end

   return output
  end
end
