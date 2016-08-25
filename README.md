[![Code Climate](https://codeclimate.com/github/andela-morekoya/checkpoint-one/badges/gpa.svg)](https://codeclimate.com/github/andela-morekoya/checkpoint-one)
[![Build Status](https://travis-ci.org/andela-morekoya/checkpoint-one.svg?branch=master)](https://travis-ci.org/andela-morekoya/checkpoint-one)
[![Coverage Status](https://coveralls.io/repos/github/andela-morekoya/checkpoint-one/badge.svg?branch=master)](https://coveralls.io/github/andela-morekoya/checkpoint-one?branch=master)

# Ruby Music Library

## Overview
This is a command line based music library that parses a directory of MP3 files and imports them into a library. Users are then able to run the commands listed in the commands section below.

## Installation
 - Ensure ruby is installed on your system.
 - Download or clone this repo.
 `git clone https://github.com/andela-morekoya/checkpoint-one.git`
 - Open the command line (terminal)
 - Navigate to the repo folder
 `cd checkpoint-one`
 - Install gems
 `bundle install`
 - Start the music library
 `ruby bin/musiclibrary`

## How does it work
When the Music Library is called, it reads from the set directory of music files.
> The default path has been set to "./db/mp3s"
>
> To change this path, open 'lib/musiclibrarycontroller.rb' and change the path variable.
> 
The music files are expected to be named in the following format: "Artist - Song - Genre.mp3"

The music files are then parsed and stored in an array

## Commands
The valid commands of the application are

1. 'list songs' => Lists all songs
2. 'list artists' => Lists all artists
3. 'list genres' => Lista all genres
4. 'play song' => Asks for the index of a song in the library and plays specified song
5. 'list artist' => Ask for an artist and lists the artist's songs
6. 'list genre' => Asks for a genre and lists the songs in that genre
7. 'help' => Lists the Library's commands
8. 'exit' => Closes the music library

## Testing
 - Make sure 'rspec' is installed
 - Run rspec
 `bundle exec rspec`

## Dependencies
 - pry
 - rpsec
 - require_all