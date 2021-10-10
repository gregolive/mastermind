# MASTERMIND

Test your wits against the computer in a game of Mastermind.

Choose to play as the **CODEMAKER** and come up with a secret code to fool your enemy.
Become the **CODEBREAKER** to crack the opponent's code in 12 turns or less.

[Live demo](https://replit.com/@gregolive/Mastermind#game.rb) 👈

## Functionality

A command version of board game [Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) made with Ruby. Players can choose to make a code usings number 1-8 that the computer player attempts to crack, or break a randomly generated code in 6, 8 10, or 12 turns depending on the selected difficulty level.

## Reflection

Building this game was a great way to get more practice using classes and ruby and was a significant step up from making the tic tac toe project. The most difficult for me was deciding how to separate the large number of required methods into either the main Game class or a seperate module. It wasn't until I completed this project that I learned that class variables can be called in an included module without error and I would apprach the separation of methods differntly with this knowledge if I were to make another Mastermind project. For example, on many module method calls I passed in class vairables that are already accessible in the module.

The main difficulty, though, was the codebreaking logic for the commputer player. I started with random guesses, however, this practically guarantees that the code goes unbroken. By bending the rules slightly for the computer I added some basic logic to the guesses, however this is something I would like to re-visit at a later date with a high understanding of Ruby.

-Greg Olive