# Seed boards and characters tables

characters_data = [
  { board: "Very Easy",
    characters: [ { name: "waldo", top_left_x: 608, top_left_y: 631,
                    width: 26, height: 53 },
                  { name: "wenda", top_left_x: 621, top_left_y: 514,
                    width: 14, height: 19 },
                  { name: "wizard", top_left_x: 920, top_left_y: 660,
                    width: 15, height: 21 } ] 
  },
  { board: "Easy",
    characters: [ { name: "waldo", top_left_x: 479, top_left_y: 327,
                    width: 28, height: 39 },
                  { name: "wizard", top_left_x: 573, top_left_y: 328,
                    width: 40, height: 51 },
                  { name: "odlaw", top_left_x: 221, top_left_y: 331,
                    width: 15, height: 59 } ] 
  },
  { board: "Normal",
    characters: [ { name: "waldo", top_left_x: 454, top_left_y: 243,
                    width: 18, height: 35 },
                  { name: "wenda", top_left_x: 664, top_left_y: 272,
                    width: 12, height: 17 },
                  { name: "wizard", top_left_x: 0, top_left_y: 225,
                    width: 18, height: 31 } ] 
  },
  { board: "Hard",
    characters: [ { name: "waldo", top_left_x: 812, top_left_y: 228,
                    width: 15, height: 23 },
                  { name: "wenda", top_left_x: 329, top_left_y: 462,
                    width: 10, height: 16 },
                  { name: "wizard", top_left_x: 385, top_left_y: 246,
                    width: 12, height: 23 },
                  { name: "odlaw", top_left_x: 215, top_left_y: 472,
                    width: 12, height: 22 } ] 
  },
  { board: "Very Hard",
    characters: [ { name: "waldo", top_left_x: 459, top_left_y: 117,
                    width: 17, height: 31 },
                  { name: "wenda", top_left_x: 327, top_left_y: 504,
                    width: 12, height: 31 },
                  { name: "wizard", top_left_x: 760, top_left_y: 25,
                    width: 15, height: 19 },
                  { name: "odlaw", top_left_x: 214, top_left_y: 499,
                    width: 11, height: 31 } ] 
  },
  { board: "Insane",
    characters: [ { name: "waldo", top_left_x: 391, top_left_y: 180,
                    width: 14, height: 33 },
                  { name: "wenda", top_left_x: 151, top_left_y: 162,
                    width: 10, height: 23 },
                  { name: "wizard", top_left_x: 761, top_left_y: 595,
                    width: 26, height: 48 },
                  { name: "odlaw", top_left_x: 168, top_left_y: 391,
                    width: 12, height: 25 } ] 
  }
]

# Clear characters tables so all characters on all boards are recreated
Character.delete_all

characters_data.each do |one_character_data|
  board = Board.find_or_create_by!(name: one_character_data[:board])
  
  one_character_data[:characters].each do |character|
    board.characters.create!( { name:       character[:name], 
                                top_left_x: character[:top_left_x], 
                                top_left_y: character[:top_left_y],
                                width:      character[:width], 
                                height:     character[:height] } )
  end
end
