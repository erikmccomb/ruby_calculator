# todo: build a calculator that supports all basic math operators + - * /
# take the first number
# take modifier
# take the last number
# puts result
# error checking
# user input and modifiers should be checked for proper input type
# the result should set first_number and allow for another modifier and last number so result continues to build until the user decides to clear the calculator
# - make + - * / work
# - make clear work


@first []
@second []


require 'pry'

def calculator
end

def first_num
  puts 'What is the first number?'
  @calc << gets.to_i
end

def operator
  puts 'Select an operator: +, -, *, /'
  choice =gets.strip
  case choice
when '+'

when '-'

when '*'

when '/'

else
  puts 'Invalid selection. Please choose a valid operator.'
end

def sec_num
  puts 'What is the second number?'
end

def result
  puts 'Calculating .......'
  puts ''
  puts "The result of "