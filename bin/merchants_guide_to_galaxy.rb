#!/usr/bin/env ruby
require_relative '../lib/intergalactic_money_calculator'

class ConsoleApplication
  include IntergalacticMoneyCalculator::ApplicationLayer

  def run
    print_header
    print_instructions
    print 'Enter a conversion note or query (enter quit to terminate): '

    while (input = gets.chomp)
      break if input == 'quit'
      process_input(input)
      print "\nEnter a conversion note or query (enter quit to terminate): "
    end
  end

  private

  def print_header
    puts
    puts '***********************************************************************************'
    puts 'Welcome to Intergalactic Money Calculator'
    puts '***********************************************************************************'
    puts
  end

  def print_instructions
    print "You can enter your conversion notes and queries in any order.\n\n"
    print "Query should begin with 'how much is' or 'how many Credits is' and end with a ?.\n\n"
    puts 'Sample conversion note: pish is X'
    print "Sample query: how much is pish tegj glob glob?\n\n"
  end

  def process_input(input)
    if conversion_note?(input)
      process_conversion_note(input)
    elsif query?(input)
      process_query(input)
    else
      puts 'I have no idea what you are talking about.'
    end
  end

  def conversion_note?(input)
    input =~ /^([a-z]+) is ([I|V|X|L|C|D|M])$/ ||
    input =~ /^(.*) is (\d+) Credits$/
  end

  def query?(input)
    input =~ /^how much is (.*)\?$/ ||
    input =~ /^how many Credits is (.*)\?$/
  end

  def process_conversion_note(note)
    request_model = ConversionNoteRequestModel.new(note: note)
    interactor = ConversionNoteInteractor.new(request_model: request_model)
    response_model = interactor.execute

    if response_model.success?
      puts 'Conversion note processed successfully.'
    else
      puts 'Conversion note is not in the correct format.'
    end
  end

  def process_query(query)
    request_model = QueryRequestModel.new(question: query)
    interactor = QueryInteractor.new(request_model: request_model)
    response_model = interactor.execute

    puts response_model.answer
  end
end

ConsoleApplication.new.run
