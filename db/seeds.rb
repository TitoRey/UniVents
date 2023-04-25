# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


users.create([
    {first_name="Bruce",last_name="Wayne",active=True,admin=True,created_at=Time.now,updated_at=Time.now,email="sirasiren007+1@gmail.com",encrypted_password="Bruce"},
    {first_name="Richard",last_name="Grayson",active=True,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+2@gmail.com",encrypted_password="Richard"},
    {first_name="Tim",last_name="Drake",active=True,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+3@gmail.com",encrypted_password="Tim"},
    {first_name="Jason",last_name="Todd",active=True,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+4@gmail.com",encrypted_password="Jason"},
    {first_name="Barbara",last_name="Gordon",active=True,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+5@gmail.com",encrypted_password="Barbara"},
    {first_name="Stephanie",last_name="Brown",active=True,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+6@gmail.com",encrypted_password="Stephanie"},
    {first_name="Cassandra",last_name="Cain",active=True,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+7@gmail.com",encrypted_password="Cass"},
    {first_name="Duke",last_name="Thomas",active=True,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+8@gmail.com",encrypted_password="Duke"},
    {first_name="Alfred",last_name="Pennyworth",active=True,admin=,created_at=Time.now,updated_at=Time.now,email="sirasiren007+9@gmail.com",encrypted_password="Alfred"},
    {first_name="Kathy",last_name="Kane",active=False,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+10@gmail.com",encrypted_password="Kathy"},
    {first_name="Damian",last_name="Wayne",active=True,admin=False,created_at=Time.now,updated_at=Time.now,email="sirasiren007+11@gmail.com",encrypted_password="Damian"},
    {first_name="Ace",last_name="the Bat Hound",active=False,admin=,created_at=Time.now,updated_at=Time.now,email="sirasiren007+12@gmail.com",encrypted_password="Ace"},
    {first_name="Selina",last_name="Kyle",active=True,admin=True,created_at=Time.now,updated_at=Time.now,email="sirasiren007+13@gmail.com",encrypted_password="Selina"},
])

events.create([
    {event_name="Picnic in the Park",event_description="Join us for some sandwiches and apple pie in the park as we lounge.",event_time=,created_at,updated_at,user_id=2},
    {event_name="Emotional Breakthroughs",event_description="Let us heal our trauma and recognize the beauty of sharing our stories.",event_time=,created_at,updated_at,user_id=1},
    {event_name="Dog's Day Out",event_description="Bring your doggos and let's do some exercise together. Fun for the whole family!",event_time=,created_at,updated_at,user_id=8},
    {event_name="D&D Session",event_description="Come join our crew as we forge through adventure with our DM to magical realms.",event_time=,created_at,updated_at,user_id=3},
    {event_name="Paint Night",event_description="Paint together with fellow artists",event_time=,created_at,updated_at,user_id=1},
    {event_name="CS321 Study Group",event_description="Study for the next quiz together for CS321.",event_time=,created_at,updated_at,user_id=8,flagged=True},
    {event_name="Pick-Up Basketball",event_description="Shoot some hoops in a casual game",event_time=,created_at,updated_at,user_id=7},
    {event_name="Monopoloy - Casual Game",event_description="Come join us as we play some Monopoly and chill",event_time=,created_at,updated_at,user_id=6},
    {event_name="CS 367 Study Group",event_description="Let's have a big brain moment as we improve our CS knowledge",event_time=,created_at,updated_at,user_id=6},
    {event_name="Soccer Offense Team",event_description="Need some goalies and others for a 2 hr session to improve soccer skills",event_time=,created_at,updated_at,user_id=6},
    {event_name="PhotoShoot",event_description="Help a fellow student level up in photography. Offering free self-portraits in exchange for your time.",event_time=,created_at,updated_at,user_id=5, flagged=True},
    {event_name="Rap Battle",event_description="Let's face it. No one's got rizz more than me. Challenge me with your best bops.",event_time=,created_at,updated_at,user_id=4},
    {event_name="Flash Mob Practice",event_description="Come join us as we prepare for our April Fools Dance Mob to the Rick Roll.",event_time=,created_at,updated_at,user_id=3,flagged=True},
])

event_users.create([
    {event_id=1,user_id=1,created_at=Time.now,updated_at=Time.now},
    {event_id=2,user_id=2,created_at=Time.now,updated_at=Time.now},
    {event_id=2,user_id=3,created_at=Time.now,updated_at=Time.now},
    {event_id=2,user_id=4,created_at=Time.now,updated_at=Time.now},
    {event_id=3,user_id=5,created_at=Time.now,updated_at=Time.now},
    {event_id=2,user_id=6,created_at=Time.now,updated_at=Time.now},
    {event_id=3,user_id=7,created_at=Time.now,updated_at=Time.now},
    {event_id=4,user_id=8,created_at=Time.now,updated_at=Time.now},
    {event_id=4,user_id=9,created_at=Time.now,updated_at=Time.now},
    {event_id=4,user_id=11,created_at=Time.now,updated_at=Time.now},
    {event_id=5,user_id=1,created_at=Time.now,updated_at=Time.now},
    {event_id=5,user_id=2,created_at=Time.now,updated_at=Time.now},
    {event_id=5,user_id=3,created_at=Time.now,updated_at=Time.now},
    {event_id=5,user_id=4,created_at=Time.now,updated_at=Time.now},
    {event_id=6,user_id=1,created_at=Time.now,updated_at=Time.now},
    {event_id=6,user_id=6,created_at=Time.now,updated_at=Time.now},
    {event_id=6,user_id=7,created_at=Time.now,updated_at=Time.now},
    {event_id=7,user_id=1,created_at=Time.now,updated_at=Time.now},
    {event_id=8,user_id=8,created_at=Time.now,updated_at=Time.now},
    {event_id=9,user_id=9,created_at=Time.now,updated_at=Time.now},
    {event_id=10,user_id=11,created_at=Time.now,updated_at=Time.now},
    {event_id=11,user_id=3,created_at=Time.now,updated_at=Time.now},
    {event_id=12,user_id=6,created_at=Time.now,updated_at=Time.now},
    {event_id=13,user_id=9,created_at=Time.now,updated_at=Time.now},
    {event_id=3,user_id=4,created_at=Time.now,updated_at=Time.now},
    {event_id=4,user_id=8,created_at=Time.now,updated_at=Time.now},
    {event_id=7,user_id=5,created_at=Time.now,updated_at=Time.now},
])


locations.create([
    {street_address="10715 West Dr",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.83986607255897, -77.3164468229714",created_at=Time.now,updated_at=Time.now,event_id=1},
    {street_address="4469 Aquia Creek Lane",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.83176763510582, -77.30878046415519",created_at=Time.now,updated_at=Time.now,event_id=2},
    {street_address="Mason Pond",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.828562521573964, -77.31044970238007",created_at=Time.now,updated_at=Time.now,event_id=3},
    {street_address="4520 Patriot Circle",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.82676138216578, -77.3043588053449",created_at=Time.now,updated_at=Time.now,event_id=4},
    {street_address="4515 Patriot Circle",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.82814443280285, -77.30626816780764",created_at=Time.now,updated_at=Time.now,event_id=5},
    {street_address="Johnson Center",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.83000941794846, -77.3074121379922",created_at=Time.now,updated_at=Time.now,event_id=6},
    {street_address="4475 Aquia Creek Lane",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.83128005542875, -77.30703949118367",created_at=Time.now,updated_at=Time.now,event_id=7},
    {street_address="4500 Patriot Circle",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.826981530418706, -77.30973368097729",created_at=Time.now,updated_at=Time.now,event_id=8},
    {street_address="Innovation Hall",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.828699041157876, -77.30737820590947",created_at=Time.now,updated_at=Time.now,event_id=9},
    {street_address="4534 Patriot Circle",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.832475789664464, -77.31214346105284",created_at=Time.now,updated_at=Time.now,event_id=10},
    {street_address="Mason Pond",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.8285592942621, -77.31014856087515",created_at=Time.now,updated_at=Time.now,event_id=11},
    {street_address="4400 University Drive",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.83260369191032, -77.30579383778613",created_at=Time.now,updated_at=Time.now,event_id=12},
    {street_address="4400 Rivanna River Way",zipcode=22030,county="Fairfax",city="Fairfax",coordinates="38.83085120235013, -77.3045932906783",created_at=Time.now,updated_at=Time.now,event_id=13},
])