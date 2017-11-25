require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - View entry number n"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
      when 1
        system "clear"
        view_all_entries
        main_menu
      when 2
        system "clear"
        create_entry
        main_menu
      when 3
        system "clear"
        search_entries
        main_menu
      when 4
        system "clear"
        view_entry
      when 5
        system "clear"
        read_csv
        main_menu
      when 6
        puts "Good-bye!"
        exit(0)
      else
        system "clear"
        puts "Sorry, that is not a valid input"
        main_menu
      end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s

      entry_submenu(entry)
    end

    system "clear"
    puts "End of entries"
  end

  def view_entry
    system "clear"

    if address_book.entries.count == 0
      puts "There are no entries in the address book!"
      main_menu
    end

    print "What entry would you like to view? "
    entry = gets.chomp.to_i

    #check to ensure an integer entered from keyboard
    #entering a string character will be converted to integer 0
    #so check ensures that 0 is not entered.
    #because users think of entries starting from 1 anyways, a user should not
    #enter 0.
    while entry > address_book.entries.count || entry == 0
      print "#{entry} is not a valid entry in the address book, please select another entry: "
      entry = gets.chomp.to_i
    end

      system "clear"

      #display addressbook entry, by subtracting 1 from what user entered.
      #so that the correct location is displayed. User wants to see 1st entry
      #would mean index 0 in the array.
      puts address_book.entries[entry - 1].to_s
      main_menu

  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"

    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
      when "n"
      when "d"
      when "e"
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        entry_submenu(entry)
      end
    end
end
