class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_admin
    #Sorry about all of the comments, trying to figure this out. -Ena
    
    #https://www.freecodecamp.org/news/understanding-the-basics-of-ruby-on-rails-sql-databases-and-how-they-work-7a628cd42073/
    #i think i do something like this with sql?:
    #find userid where admin
    #User.all gets a collection of all users
    #From https://guides.rubyonrails.org/active_record_basics.html:
    #users = User.where(name: 'David', occupation: 'Code Artist').order(created_at: :desc)
    #changed in this case to
    #user_is_admin = User.where(id: <this user's id>, admin: true)
    #return self.instance_variable_get(@admin)

    #Somewhere else in the code it will call u.is_admin where u is an instance of User
    #Since u is an instance of an object, this method is in the context of an instance, so we can just access the field
    #Additionally, DB records <=> Model objects. When you get a record you can manipulate it like an object in the model
    #self. is equivalent to this. from java
    return self.admin
  end
end
