# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
class Contact
  attr_accessor  :id, :first_name, :last_name, :email, :note
  @@contacts = []
  @@next_id = 1

  def initialize(first_name, last_name, email, note)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end
#-- the responsibility of the contact.rb below
#display full name
  def full_name
  puts "#{first_name} #{last_name}"
  end
#create new contact/store contacts in array
  def self.create(first_name, last_name, email, note)
    # 1. Make a new Contact
    new_contact = new(first_name, last_name, email, note)

     #2. Add it to the list of contacts (@@contacts)
    @@contacts << new_contact

     #3. Increment the global id
    @@next_id += 1

     #4. Return the Contact we just created
    new_contact
  end
##show all contact
  def self.all
    p @@contacts
  end
##find contact via ID
  def self.find(id)
    @@contacts.find{|contact| contact.id == id}
  #  @@contacts.each do |contact|
  #    contact.id == id
  end
##search contact
  def self.find_by(attribute, value)
    @@contacts.select{|contact| contact.send(attribute) == value}
    #@@contact.find_by(:first_name, "#{:email}")
  end


#    ##update contact
# This method takes no arguments
  # It should delete all of the contacts from memory
  def self.delete_all
    # Fill this in
    @@contacts.clear
  end

  # This method takes no arguments
  # It should return a string that is composed of the first and last names of the contact.
  def full_name
     "#{first_name} #{last_name}" #<= no space needed
    # Fill this in
  end

  # This method should take two string arguments (attribute, value)
  # It should update the current instance of contact with the new value of the attribute
  #
  # For example:
  #   mary.update('email', 'mary_new_email@gmail.com')
  # should update mary's email address to the new one.
  def update(attribute, value)
    self.send("#{attribute}=",value) #<= when attr_accessor creates method, there are 1)attr_reader, and 2) attr_writer
    #so attribute is a two method. to make it clear that I'm calling attr_writer this case,
    #I need it to be attribute=. think = is a tunnel to access the modifier.
    #print value

    # Fill this in
  end

  # This method takes no arguments
  # It should delete the current instance of contact from memory
  def delete
    # Fill this in
    # puts "Enter ID of the contact you want to delete."
    # user_selected_id = gets
    # Contact.find(user_selected_id) = id_delete
    # id_delete.delete
    @@contacts.delete self

  end

end
#
 Contact.create("Mina","Mikhail", "mina@bitmaker.co","Awesome")
 Contact.create("Hisayo", "Horie", "hisayo@bitmaker.com","Good")
