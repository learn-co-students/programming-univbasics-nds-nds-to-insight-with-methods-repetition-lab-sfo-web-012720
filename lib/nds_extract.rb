$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
   # binding.pry
    director_index += 1
  end
  #binding.pry
  result
end
# binding.pry

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  
  total
  #binding.pry
end

def list_of_directors(source)
  # Write this implementation
  arr = []
  i = 0
  # directors_source = source.length
  while i < source.length do
    arr << source[i][:name]
    i += 1
  end
  arr
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  total = 0
  list = list_of_directors(source)
  ele = directors_totals(source)
  # binding.pry
  i = 0
  while i < list.length do
    # binding.pry
    # num = ele[i]
    # binding.pry
    total += ele[list[i]]
    # binding.pry
    i += 1
  end
  total
end

