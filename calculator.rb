require 'pry'
require 'colorize'

@calc = []

def first_num
  puts 'What is the first number?'.colorize(:green)
  puts 'Any letter entered will become 0.'.colorize(:yellow)
  @calc << gets.to_i

  operator
end

def operator
  puts 'Select an operator:'.colorize(:green)
  puts '1) +'.colorize(:green)
  puts '2) -'.colorize(:green)
  puts '3) *'.colorize(:green)
  puts '4) /'.colorize(:green)
  puts '5) Square'
  puts '6) square root'
  puts '7) Raise to the power of'
  @oper = gets.to_i
  sec_num
end

def sec_num
  puts 'What is the second number?'.colorize(:green)
  puts 'Any letter entered will become 0.'.colorize(:yellow)
  @calc << gets.strip.to_i
  answer
end

def calculation
  case @oper
    when 1
      # binding.pry
      @result = @calc[0].to_i + @calc[1].to_i
    when 2
      @result = @calc[0].to_i - @calc[1].to_i
    when 3
      @result = @calc[0].to_i * @calc[1].to_i
    when 4
      if @calc[1] == 0
        puts 'Invalid entry for the second number'.colorize(:red)
        @calc = []
        @oper = []
        first_num
      else
      @result = @calc[0].to_i / @calc[1].to_i
      end
    when 5

    when 6

    when 7
      
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
  puts "#{@calc[0]} #{@oper} #{@calc[1]} = #{@result}".colorize(:green)
  puts ''
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