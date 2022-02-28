# README

Ruby version
3.0.0

Rails version
6.1.4

DataBase
pg 1.1

Steps to run the project

- bundle install
- rails db:create
- rails db:seed
- rails db:migrate

rails s to start the server on port 3000

TicTacToe game made with Rails Api, Postgres and ReactJs

Things you may want to cover:

- There are 9 tiles with a number assign to them
- There are 8 winning combinations

[1,2,3], [4,5,6], [7,8,9]
[1,4,7], [2,5,8], [3,6,9]
[1,5,9], [3,5,7]

Technical Description

- We have a GameBoard object and a Move object GameBoard has many moves, Position describe which player moves
- If Position mode is not equal to 0 then Player 1 makes the odd moves else Player 2 makes the even moves
- A click is made on a tile
- Api call is sent and move is saved to the database with the number of the tile
- A function is called created after the object is saved
- If a player manages to click on a winning combination, we have a winner If we have 9 moves without a winner we have a tie
