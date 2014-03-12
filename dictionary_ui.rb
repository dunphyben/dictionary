require './lib/term'

def main_menu
  puts "-"*40, "Main Menu:\n", "-"*40
  puts "\ta: Add a word to the dictionary\n",
       "\tl: List all words in dictionary\n",
       "\ts: Show a word's definition by searching\n",
       "\te: Edit the definition of a word by searching\n",
       "\td: Delete a word from the dictionary\n",
       "\tx: Exit dictionary"
  print "\nChoose an option: "
  choice = gets.chomp

  case choice
  when 'a'
    add_term
    main_menu
  when 'l'
    list_words
    main_menu
  when 's'
    show_definition
    main_menu
  when 'e'
    edit_definition
    main_menu
  when 'd'
    delete_term
    main_menu
  when 'x'
    puts "Goodbye!"
  else
    puts "Invalid option!"
    main_menu
  end
end

def add_term
  print "\nEnter a word to add: "
  word = gets.chomp
  print "Enter a definition: "
  definition = gets.chomp
  Term.create(word, definition)
  puts "\n\"#{word}\" added to dictionary\n\n"
end

def list_words
  print "\nYour dictionary includes the following words:\n\n"
  puts "*"*30
  Term.all.each do |term|
    puts term.word
  end
  puts "*"*30
  puts "\n\n"
end

def show_definition
  print "Enter a word to show definition: "
  word = gets.chomp
  result = nil
  Term.all.each do |term|
    if term.word == word
      result = term
    end
  end
  if result.nil?
    puts "Word not found in dictionary!"
  else
    puts "The definition of #{word} is: " + "\"" + result.definition + "\""
  end
end

def edit_definition
  print "Enter the word that you wish to modify the definition of: "
  word = gets.chomp
  result = nil
  Term.all.each do |term|
    if term.word == word
      result = term
    end
  end
  if result.nil?
    puts "Word not found in dictionary!"
  else
    print "Enter new definition: "
    definition = gets.chomp
    result.definition = definition
    puts "\nYou have successfully changed the definition of \"#{word}\" to \"#{definition}\".\n\n"
  end
end

def delete_term
  print "Enter the word you wish to delete from the dictionary: "
  word = gets.chomp
  result = nil
  Term.all.each do |term|
    if term.word == word
      result = term
    end
  end
  if result.nil?
    puts "Word not found in dictionary!"
  else
    puts "Are you sure you wish to delete #{word} from the dictionary? Press 'y' to delete, 'n' to return.\n"
    choice = gets.chomp
    case choice
    when 'y'
      Term.all.delete result
      puts "\nYou have successfully deleted \"#{word}\" from dictionary."
    when 'n'
      main_menu
    end
  end
end


main_menu





