# Mastermind Game

## Overview
This project is part of The Odin Project: [Mastermind](https://www.theodinproject.com/lessons/ruby-mastermind), where I implement a command-line version of the classic Mastermind game where players have 12 turns to guess a secret code created by the computer. Players can choose to guess the computer's code or create their own secret code for the computer to guess.

## Live Demo
You can play the Mastermind game online by accessing the following link:
[Play Mastermind on Replit](https://replit.com/@jambalong/mastermind)

## Features
- **Two Roles:** Players can either be the code creator or the guesser.
- **Random Code Generation:** The computer randomly selects a secret code consisting of colors.
- **Feedback System:** The game provides feedback on the accuracy of the guesses each turn.
- **Intelligent Computer Guessing:** If the player creates a secret code, the computer can use a strategy to make informed guesses based on previous attempts.

## How It Works
1. The game starts by allowing the player to choose their role.
2. If the player is the code creator, they select a code consisting of digits `1-6`.
3. The computer makes guesses and receives feedback on how close its guesses are.
4. Players can make up to 12 guesses to find the correct code.

## Learning Objectives
This project demonstrates:
- Understanding of object-oriented programming principles.
- Implementation of game logic and algorithms.
- User input handling and random number generation.
- Design patterns for creating interactive command-line applications.

## Installation
1. **Prerequisites:**
   - Ruby installed on your machine.

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/jambalong/mastermind.git
   cd mastermind
   ```

3. **Run the Game:**
   ```ruby
   ruby main.rb
   ```
