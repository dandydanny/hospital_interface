# # Solution for Challenge: Hospital Interface. Started 2014-01-14T22:05:08+00:00
# $ ruby hospital.rb
# > Welcome to Misty River Hospital
# > -------------------------------
# > Please enter your username:
# > ruby_tuesday
# > Please enter your password:
# > ********
# > -------------------------------
# > Welcome, ruby_tuesday.  Your access level is: DOCTOR
# > -------------------------------
# > What would you like to do?
# > Options:
# > - list_patients
# > - view_records <patient_id>
# > - add_record <patient_id>
# > - remove_record <patient_id> <record_id>
require 'csv'
require 'debugger'

class Hospital
  attr_reader :hospital_name, :location
  attr_accessor :people
  def initialize
    @hospital_name = "Creepy Hollow Asylum"
    @location = "Salem, MA"
    @people = []
  end

  def authenticate(check_this_id, password)
    p @people
    p @people.last
    p @people.last.id
    p @people.any?{|a| a.last.id == check_this_id}
    # p @people.include(id)
  end
end

class Person
  attr_reader :id, :name, :password, :admin
  def initialize(id, name, password)
    @id = id
    @name = name
    @admin = false
    @password = password
  end
end

class Patient < Person
  attr_accessor :record
  def initialize(id, name, password, record)
    super id, name, password
    @record = record
  end
end

class Employee < Person
  attr_reader :job
  def initialize(id, name, password)
    super id, name, password
    @job = nil
  end
end

class Janitor < Employee
  def initialize(id, name, password)
    super id, name, password
    @job = "Janitor"
  end
end

class Doctor < Employee
  def initialize(id, name, password)
    super id, name, password
    @admin = true
    @job = "Doctor"
  end
end


# add patient

# remove patient
def login_menu
  "Please enter ID and password, separated by space"
end

def main_menu
  "    1. Look up records
    2. Modify records
    3. Add patient
    4. Delete patient"
end

def display(stuff)
  puts stuff
end

def clear_display
  puts "\e[H\e[2J"
end





# ----------- Test code ---------------
puts "\e[H\e[2J"
hh = Hospital.new
# print_menu

nick = Doctor.new(1, "Nick", "1234")
# p nick.name
# p nick.admin

# # New non-admin janitor
bobby = Janitor.new(2, "Bobby", "1234")
# p bobby
# p bobby.name
# p bobby.admin

# # New patient
danny = Patient.new(3, "Danny", "1234", "Suffering from guinea pig-related anxiety")
# p danny
# p danny.name

# # admit / store patient
hh.people << danny
hh.people << bobby
hh.people << nick

# p hh.people.length
# p hh.people
  
  clear_display
  puts "Welcome to #{hh.hospital_name} located in #{hh.location}."
  auth = false
  until auth == true
    display(login_menu)
    input = gets.chomp.split(" ")
    auth == hh.authenticate(input[0], input[1])
    display(main_menu)
  end
  











    
    # puts "Please enter your password"
    # password = gets.chomp
    # if password == "admin"
    #   puts "please enter patient name"
    #   @name = gets.chomp
    #   puts "please enter patient illness"
    #   @illness = gets.chomp
    #   puts "please enter room number"
    #   @room_no = gets.chomp
    #   #debugger
    #   ########self.patients << [@name, @illness, @room_no]
    #   admit_patient([@name, @illness, @room_no])
    # else
    #   puts "access denied".upcase
    # end
