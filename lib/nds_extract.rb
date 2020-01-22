$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'
require 'pry'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.length do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  directors = []
  row = 0
  while row < source.length do
    director = source[row]
    directors << director[:name]
    row += 1
  end
    directors
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
  row = 0
  director = source[row]
  totals = directors_totals(director)
  totals.values.sum
end

def gross_for_director(director_data)
  row = 0
  total = 0
  while row < director_data[:movies].length
    total += director_data[:movies][row][:worldwide_gross]
    row += 1
  end
  total
end


def directors_totals(nds)
  result = {}
  row = 0
  while row < directors_database.length do
    column = 0
    totals = 0
    while column < directors_database[row][:movies].length do
        totals += directors_database[row][:movies][column][:worldwide_gross]
        column += 1
    end
      result.store(directors_database[row][:name], totals)
      row += 1
  end
  result
end


