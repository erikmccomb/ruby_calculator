require 'pry'
require 'colorize'

@calc = []

def first_num
  puts 'What is the first number?'.colorize(:yellow)
  puts 'Any letter entered will become 0.'.colorize(:blue)
  @calc << gets.to_i

  operator
end

def operator
  puts 'Select an operator:'.colorize(:green)
  puts '+'.colorize(:green)
  puts '-'.colorize(:green)
  puts '*'.colorize(:green)
  puts '/'.colorize(:green)
  puts 'Squared'.colorize(:green)
  puts 'Square root'.colorize(:green)
  puts 'Power of'.colorize(:green)
  @oper = gets.strip.downcase
  sec_num
end

def sec_num
  case @oper
    when '+', '-', '*', '/','power of'
      puts 'What is the second number?'.colorize(:yellow)
      puts 'Any letter entered will become 0.'.colorize(:blue)
      @calc << gets.strip.to_i
      answer
    when 'squared', 'square root'
      answer
    else
      puts 'Error in operation; please try again.'.colorize(:red)
      calculator
  end
end

def calculation
  case @oper
    when "+"
      # binding.pry
      @result = @calc[0] + @calc[1]
    when "-"
      @result = @calc[0] - @calc[1]
    when "*"
      @result = @calc[0] * @calc[1]
    when "/"
      if @calc[1] == 0
        puts 'Invalid entry for the second number'.colorize(:red)
        @calc = []
        @oper = []
        first_num
      else
      @result = @calc[0].to_i / @calc[1].to_i
      end
    when 'squared'
      @result = @calc[0] ** 2
    when 'square root'
      @result = @calc[0] ** 0.5
    when 'power of'
      @result = @calc[0] ** @calc[1]
    else 
      puts 'Error in operation; please try again.'.colorize(:red)
      calculator
  end
end

def answer
  puts ''
  puts '.'.colorize(:yellow)
  puts '..'.colorize(:yellow)
  puts '...'.colorize(:yellow)
  puts 'Calculating ...'.colorize(:yellow)
  puts ''
  calculation
  case @oper
    when '+', '-', '*', '/'
      puts "#{@calc[0]} #{@oper} #{@calc[1]} = #{@result}".colorize(:green)
      puts ''
    when 'squared', 'square root'
      puts "#{@calc[0]} #{@oper} = #{@result}"
      puts ''
    when 'power of'
      puts "#{@calc[0]} to the power of #{@calc[1]} = #{@result}"
    else
      puts 'Error in operation; please try again.'.colorize(:red)
      calculator
  end
  @kept = @result
  @calc = []
  @oper = []
  another
end

def another
  puts ''
  puts "Would you like to run another equation using the previous answer, #{@kept}?"
  puts ''
  puts '1) Yes'.colorize(:green)
  puts '2) No'.colorize(:red)
  puts ''
  choice = gets.to_i
  case choice
    when 1
     @calc[0] = @kept
     @kept = []
     puts "The first number in your equation has been set to #{@calc[0]}.".colorize(:yellow)
     operator
    when 2
      puts ''
      puts 'Returning to main menu.'.colorize(:yellow)
      puts ''
      calculator
    else
      puts 'Please select a valid option.'.colorize(:red)
      another
  end
end

def last_answer
  puts "Your last answer was #{@result}."
  puts 'How would you like to continue?'.colorize(:green)
  puts '1) Clear last answer.'.colorize(:yellow)
  puts '2) Use last answer in a new equation.'.colorize(:green)
  puts '3) Return to the main menu.'.colorize(:red)
  men_sel = gets.to_i
  case men_sel
    when 1
      @result =[]
      @kept = []
      puts 'Answer cleared. Returning to main menu.'.colorize(:yellow)
      calculator
    when 2
      @calc[0] = @kept
      puts "The first number in your equation has been set to #{@kept}.".colorize(:yellow)
      operator          
    when 3
      calculator
    else
      puts 'Please enter a valid selection'.colorize(:red)
  end
end

def calculator
  puts ''
  puts 'What would you like to do?'
  puts ''
  puts '1) Calculate'.colorize(:green)
  puts '2) View or clear last equation answer'.colorize(:yellow)
  puts '3) Exit'.colorize(:red)
  choice = gets.to_i
  case choice
    when 1
      first_num
    when 2
      last_answer
    when 3
      exit
    else
      puts 'Please select a valid option'.colorize(:red)
      calculator
  end
  calculator
end

puts '-------------------------'.colorize(:green)
puts 'Welcome to my calculator!'.colorize(:green)
puts '-------------------------'.colorize(:green)
calculator