# TicTacToe

## Overview
This is a simple TicTacToe game implemented in Godot. The game features a basic AI opponent using the Minimax algorithm, with plans to incorporate Alpha-Beta pruning for improved performance.

![TicTacToe Game](https://github.com/RaspberryTaster/TicTacToe/blob/main/NVIDIA_Share_qOZ8E9RTuR.gif)

## Features
- Play against the computer
- Implemented AI using the Minimax algorithm

## To-Do List
- [ ] Add Alpha-Beta pruning to the Minimax algorithm for optimization


## Minimax Algorithm
The Minimax algorithm is a decision-making algorithm, commonly used for playing games. It provides the optimal move for the player assuming the opponent also plays optimally. The algorithm works by simulating all possible moves and their outcomes, then choosing the move with the best possible outcome.

### How It Works
1. **Maximizing and Minimizing Players**: The algorithm treats the AI as the maximizing player and the human as the minimizing player.
2. **Score Evaluation**: It recursively evaluates the game tree, scoring the end states with +10 for a win, -10 for a loss, and 0 for a draw.
3. **Recursive Function**: The function returns the best possible score for the maximizing player and the worst possible score for the minimizing player.

## Installation and Usage
1. **Clone the Repository**:
   ```sh
   git clone https://github.com/RaspberryTaster/TicTacToe.git
