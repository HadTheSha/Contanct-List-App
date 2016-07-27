require_relative 'contact'

# Interfaces between a user and their contact list. Reads from and writes to standard I/O.
class ContactList

  # TODO: Implement user interaction. This should be the only file where you use `puts` and `gets`.
  def print_array(contacts) 
    contacts.each do |a|
      print_contact(a)
    end
  end

  def print_contact(contact)

    puts "#{contact.id}: #{contact.name} #{contact.email}"

  end

  def  menue 
    puts "Here is a list of available commands"
    puts "new\t - Creat a new contact"
    puts "list\t - List all contancts"
    puts "show\t - Show a contact"
    puts "search\t - Search contancts"
  end

  def start (val)
    case val
    when nil 
      menue
    when "new"
      puts " Enter the full name of new contact"
      name = STDIN.gets.chomp
      puts "Enter the E-mail of #{name}"
      email = STDIN.gets.chomp  
      Contact.create(name, email)
    when "list"
      print_array(Contact.all)
    when "show" 
      if ARGV[1] != nil
        contact = Contact.find(ARGV[1].to_i) 
        if contact 
          print_contact(contact)
        else 
          puts "Not Found"
        end
      end
    when "search"
      if ARGV[1] != nil
        contacts = Contact.search(ARGV[1])
        if contacts.empty?
         puts "Not Found"
        else 
         print_array(contacts)
        end
      end
    end  
  end

end


def main
  contact= ContactList.new
  contact.start(ARGV[0])
end

main


