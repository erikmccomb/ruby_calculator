require 'pry'
require 'colorize'

@calc = []

def first_num
  puts 'What is the first number? Any letter entered will become 0.'
  @calc << gets.to_i

  operator
end

def operator
  puts 'Select an operator: +, -, *, /'
  @oper = gets.strip
  sec_num
end

def sec_num
  puts 'What is the second number? Any letter entered will become 0.'
  @calc << gets.strip.to_i
  answer
end

def calculation
  case @oper
    when "+"
      # binding.pry
      @result = @calc[0].to_i + @calc[1].to_i
    when "-"
      @result = @calc[0].to_i - @calc[1].to_i
    when "*"
      @result = @calc[0].to_i * @calc[1].to_i
    when "/"
      if @calc[1] == 0
        puts 'Invalid entry for the second number'
        @calc = []
        @oper = []
        first_num
      else
      @result = @calc[0].to_i / @calc[1].to_i
      end
    else 
      puts 'Error in operation; please try again.'
      calculator
  end
end

def answer
  puts ''
  puts '.'
  puts '..'
  puts '...'
  puts 'Calculating ...'
  puts ''
  calculation
  puts "#{@calc[0]} #{@oper} #{@calc[1]} = #{@result}"
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
  puts '1) Yes'
  puts '2) No'
  puts ''
  choice = gets.to_i
  case choice
    when 1
     @calc[0] = @kept
     @kept = []
     puts "The first number in your equation has been set to #{@calc[0]}."
     operator
    when 2
      puts ''
      puts 'Returning to main menu.'
      puts ''
      calculator
    else
      puts 'Please select a valid option.'
  end
end

def last_answer
  puts "Your last answer was#{@result}."
  puts 'How would you like to continue?'
  puts '1) Clear last answer.'
  puts '2) Use last answer in a new equation.'
  puts '3) Return to the main menu.'
  men_sel = gets.to_i
  case men_sel
    when 1
      @result =[]
      put 'Answer cleared. Returning to main menu.'
      calculator
    when 2
      another
      @calc[0] = @kept
      puts "The first number in your equation has been set to #{@kept}."
      operator          
      'puts'
    when 3
      calculator
    else
      puts 'Please enter a valid selection'
  end
end

def calculator
  puts ''
  puts 'What would you like to do?'
  puts ''
  puts '1) Calculate'
  puts '2) View or clear last equation answer'
  puts '3) Exit'
  choice = gets.to_i
  case choice
    when 1
      first_num
    when 2
      last_answer
    when 3
      exit
    else
      puts 'Please select a valid option'
      calculator
  end
  calculator
end
puts 'Welcome to my calculator!'
calculator