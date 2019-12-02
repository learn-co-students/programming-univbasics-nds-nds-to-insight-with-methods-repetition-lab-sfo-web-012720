$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  
  result
end

=begin
input/output using director database as source:

1st run 
director_index = 0

director = directors_database[0] --> 1st hash
{
 "Stephen Spielberg" => gross_for_director
}

2nd run 
director_index = 1 
director = directors_database[1] --> 2nd hash

{
  "Russo Brothers" => gross_for_director
}


=end 



def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

=begin
input output

1st run
total = 0 
index = 0 

total = Spielberg[:movies][0]#Jaws[:worldwide_gross]#260000000

2nd run 
total = 260000000
index = 1 

total = Spielberg[:movies][1]#CloseE[:worldwide_gross]#135189114
=end