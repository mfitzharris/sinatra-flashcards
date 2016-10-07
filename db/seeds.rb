#key is question #value is answer

movies = [
  {:question => "Who is the lead actor of Snakes on a Plane that demanded the studio keep the title because it was the only reason he accepted the role?",
   :answer => "Samuel L. Jackson", deck_id: 1 },
  {:question => "In National Treasure the 'good guys' in the movie used Google and the bad guys used which competing search enginge?",
    :answer => "yahoo", deck_id: 1},
  {:question => "In Iron Man/Avengers what does the acronym J.A.R.V.I.S stand for?",
   :answer => "just a rather very intelligent system", deck_id: 1}
        ]

random = [

  {:question => "Average person does what 13 times a day?",
   :answer => "laughs", deck_id: 2},
  {:question => "What was the puck made out of in the first ever hockey game. Hockey was invented in Canada",
   :answer => "frozen cow manure", deck_id: 2},
  {:question => "What is the only land mammal that cannot jump?",
   :answer => "elephants", deck_id: 2},
  {:question => "Cows can only go one way on stairs. Up or down?",
   :answer => "up", deck_id: 2 }
         ]

Deck.create(name: "movies")
Deck.create(name: "random")

movies.each {|qa| Card.create(qa) }
random.each {|qa| Card.create(qa) }
