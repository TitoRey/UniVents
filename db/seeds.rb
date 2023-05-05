# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([ 

    {first_name:"Bruce",last_name:"Wayne",active:true,admin:true,email:"ssekar+1@gmu.edu",password:"Bruce1"}, 

    {first_name:"Richard",last_name:"Grayson",active:true,admin:false,email:"ssekar+2@gmu.edu",password:"Richard"}, 

    {first_name:"Tim",last_name:"Drake",active:true,admin:false,email:"ssekar+3@gmu.edu",password:"Tim234"}, 

    {first_name:"Jason",last_name:"Todd",active:true,admin:false,email:"ssekar+4@gmu.edu",password:"Jason7"}, 

    {first_name:"Barbara",last_name:"Gordon",active:true,admin:false,email:"ssekar+5@gmu.edu",password:"Barbara"}, 

    {first_name:"Stephanie",last_name:"Brown",active:true,admin:false,email:"ssekar+6@gmu.edu",password:"Stephanie"}, 

    {first_name:"Cassandra",last_name:"Cain",active:true,admin:false,email:"ssekar+7@gmu.edu",password:"Cass35"}, 

    {first_name:"Duke",last_name:"Thomas",active:true,admin:false,email:"ssekar+8@gmu.edu",password:"Duke981"}, 

    {first_name:"Alfred",last_name:"Pennyworth",active:true,admin:false,email:"ssekar+9@gmu.edu",password:"Alfred"}, 

    {first_name:"Kathy",last_name:"Kane",active:false,admin:false,email:"ssekar+10@gmu.edu",password:"Kathy1"}, 

    {first_name:"Damian",last_name:"Wayne",active:true,admin:false,email:"ssekar+11@gmu.edu",password:"Damian"}, 

    {first_name:"Ace",last_name:"the Bat Hound",active:false,admin:false,email:"ssekar+12@gmu.edu",password:"Ace5321"}, 

    {first_name:"Selina",last_name:"Kyle",active:true,admin:true,email:"ssekar+13@gmu.edu",password:"Selina"}, 

]) 

Event.create!([ 

    {event_name:"Picnic in the Park",event_description:"Join us for some sandwiches and apple pie in the park as we lounge.",event_time:"Tue, 16 May 2023 03:50:50.494154000 UTC +00:00",user_id:2}, 

    {event_name:"Emotional Breakthroughs",event_description:"Let us heal our trauma and recognize the beauty of sharing our stories.",event_time:"Wed, 7 June 2023 12:30:50.494154000 UTC +00:00",user_id:1}, 

    {event_name:"Dog's Day Out",event_description:"Bring your doggos and let's do some exercise together. Fun for the whole family!",event_time:"Thu, 25 May 2023 14:00:50.494154000 UTC +00:00",user_id:8}, 

    {event_name:"D&D Session",event_description:"Come join our crew as we forge through adventure with our DM to magical realms.",event_time:"Fri, 19 May 2023 16:00:00.494154000 UTC +00:00",user_id:3}, 

    {event_name:"Paint Night",event_description:"Paint together with fellow artists",event_time:"Sat, 20 May 2023 22:15:50.494154000 UTC +00:00",user_id:1}, 

    {event_name:"CS321 Study Group",event_description:"Study for the next quiz together for CS321.",event_time:"Sun, 21 May 2023 07:45:50.494154000 UTC +00:00",user_id:8,flagged:true}, 

    {event_name:"Pick-Up Basketball",event_description:"Shoot some hoops in a casual game",event_time:"Sat, 13 May 2023 12:30:50.494154000 UTC +00:00",user_id:7}, 

    {event_name:"Monopoloy - Casual Game",event_description:"Come join us as we play some Monopoly and chill",event_time:"Sun, 28 May 2023 13:30:50.494154000 UTC +00:00",user_id:6}, 

    {event_name:"CS 367 Study Group",event_description:"Let's have a big brain moment as we improve our CS knowledge",event_time:"Mon, 15 May 2023 02:58:50.494154000 UTC +00:00",user_id:6}, 

    {event_name:"Soccer Offense Team",event_description:"Need some goalies and others for a 2 hr session to improve soccer skills",event_time:"Fri, 2 June 2023 10:45:50.494154000 UTC +00:00",user_id:6}, 

    {event_name:"PhotoShoot",event_description:"Help a fellow student level up in photography. Offering free self-portraits in exchange for your time.",event_time:"Mon, 15 May 2023 08:15:50.494154000 UTC +00:00",user_id:5, flagged:true}, 

    {event_name:"Rap Battle",event_description:"Let's face it. No one's got rizz more than me. Challenge me with your best bops.",event_time:"Thu, 1 June 2023 18:30:50.494154000 UTC +00:00",user_id:4}, 

    {event_name:"Flash Mob Practice",event_description:"Come join us as we prepare for our April Fools Dance Mob to the Rick Roll.",event_time:"Mon, 15 May 2023 17:10:50.494154000 UTC +00:00",user_id:3,flagged:true}, 

]) 


EventUser.create!([ 

    {event_id:1,user_id:1}, 

    {event_id:2,user_id:2}, 

    {event_id:2,user_id:3}, 

    {event_id:2,user_id:4}, 

    {event_id:2,user_id:6},

    {event_id:3,user_id:5},  

    {event_id:3,user_id:7}, 

    {event_id:3,user_id:4},

    {event_id:4,user_id:8}, 

    {event_id:4,user_id:1}, 

    {event_id:4,user_id:9}, 

    {event_id:4,user_id:11}, 

    {event_id:5,user_id:3}, 

    {event_id:5,user_id:2}, 

    {event_id:5,user_id:6}, 

    {event_id:5,user_id:4}, 

    {event_id:6,user_id:1}, 

    {event_id:6,user_id:6}, 

    {event_id:6,user_id:7}, 

    {event_id:7,user_id:1}, 

    {event_id:7,user_id:5},

    {event_id:8,user_id:8}, 

    {event_id:9,user_id:9}, 

    {event_id:10,user_id:11}, 

    {event_id:11,user_id:3}, 

    {event_id:12,user_id:6}, 

    {event_id:13,user_id:9},  

]) 


Location.create!([ 

    {street_address:"10715 West Dr",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.83986607255897, -77.3164468229714",event_id:1}, 

    {street_address:"4469 Aquia Creek Lane",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.83176763510582, -77.30878046415519",event_id:2}, 

    {street_address:"Mason Pond",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.828562521573964, -77.31044970238007",event_id:3}, 

    {street_address:"4520 Patriot Circle",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.82676138216578, -77.3043588053449",event_id:4}, 

    {street_address:"4515 Patriot Circle",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.82814443280285, -77.30626816780764",event_id:5}, 

    {street_address:"Johnson Center",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.83000941794846, -77.3074121379922",event_id:6}, 

    {street_address:"4475 Aquia Creek Lane",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.83128005542875, -77.30703949118367",event_id:7}, 

    {street_address:"4500 Patriot Circle",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.826981530418706, -77.30973368097729",event_id:8}, 

    {street_address:"Innovation Hall",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.828699041157876, -77.30737820590947",event_id:9}, 

    {street_address:"4534 Patriot Circle",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.832475789664464, -77.31214346105284",event_id:10}, 

    {street_address:"Mason Pond",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.8285592942621, -77.31014856087515",event_id:11}, 

    {street_address:"4400 University Drive",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.83260369191032, -77.30579383778613",event_id:12}, 

    {street_address:"4400 Rivanna River Way",zipcode:22030,county:"Fairfax",city:"Fairfax",coordinates:"38.83085120235013, -77.3045932906783",event_id:13}, 

]) 