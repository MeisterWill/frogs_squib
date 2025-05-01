require 'squib'

data = Squib.csv file: 'Hat table - Sheet1.csv'


def style_text(text)
  text.to_s
    .gsub(/(On success)/, '<i>On success</i>')
    .gsub(/Wit/, '<span foreground="blue">Wit</span>')
    .gsub(/Sproink/, '<span foreground="red">Sproink</span>')
    .gsub(/Roundness/, '<span foreground="green">Roundness</span>')
    .gsub(/Hit/, '<i>Hit</i>')
end


Squib::Deck.new(cards: data['Name'].size, layout: 'layout.yml') do
  background color: "white"

  rect layout: 'cut'

  text str: data['Name'],
    layout: 'name'

  text str: data['Level'].map{|lvl|"Level #{lvl}"},
    layout: 'level'

  text str: data['Flavor Text'],
    layout: 'flavor_text'

  #Ability 1

  text str: data['Ability 1 Name'],
    layout: 'ability1_name'

  text str: data['Ability 1 Effect'].map{|e| style_text(e)},
    markup: true,
    layout: 'ability1_effect'

  
  #Ability 2

  text str: data['Ability 2 Name'],
  layout: 'ability2_name'

  text str: data['Ability 2 Effect'],
    layout: 'ability2_effect'
  
  save format: :png
end
