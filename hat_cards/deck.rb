require 'squib'

data = Squib.csv file: 'Hat table - Sheet1.csv'

Squib::Deck.new(cards: data['Name'].size, layout: 'layout.yml') do
  background color: "white"
  
  text str: data['Name']  # data['Name'] is already an array of strings
  
  save format: :png
end
