/*
**********Project Name: xo_game
**********File Name: playing_controller
**********Created At: 30-May-24 5:18 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xo_game/main.dart';

class PlayingController extends GetxController {
  static String playerOneSymbol = sharedPreferences.getString("playerOneSymbol")!;
  static String playerTwoSymbol = sharedPreferences.getString("playerTwoSymbol")!;

  //initial turn on player that has O symbol.
  Map<String, bool> playersTurn = {
    "One": playerOneSymbol == "o",
    "Two": playerTwoSymbol == "o",
  };
  int actionsNumber = 0, winner = 0, playerOneScore = 0, playerTwoScore = 0, bfsValue = 0;
  List<int> activeCells = [], winnerCells = [];
  List<String> gameValues = ["", "", "", "", "", "", "", "", ""];

  clearPlayingPage() {
    playersTurn = {
      "One": playerOneSymbol == "o",
      "Two": playerTwoSymbol == "o",
    };
    actionsNumber = 0;
    winner = 0;
    activeCells = [];
    winnerCells = [];
    gameValues = ["", "", "", "", "", "", "", "", ""];

    update();
  }

  changePlayerTurn() {
    playersTurn["One"] = !playersTurn["One"]!;
    playersTurn["Two"] = !playersTurn["Two"]!;

    update();
  }

  activeCell(int index) {
    activeCells.add(index);

    update();
  }

  addValue(int index) {
    if (playersTurn["One"]!) {
      gameValues[index] = playerOneSymbol;
    } else {
      gameValues[index] = playerTwoSymbol;
    }

    actionsNumber++;

    if (actionsNumber >= 5) {
      winnerLogic();
    }
    update();
  }

  addWinner(String symbol) {
    if (playerOneSymbol == symbol) {
      winner = 1;
      playerOneScore++;
    } else {
      winner = 2;
      playerTwoScore++;
    }
    actionsNumber++;
    update();
  }

  winnerLogic() {
    // Horizontal Check
    for (int i = 0; i <= 6; i += 3) {
      if (gameValues[i] == "o" && gameValues[i + 1] == "o" && gameValues[i + 2] == "o") {
        addWinner("o");
        winnerCells = [i, i + 1, i + 2];
        break;
      }
      if (gameValues[i] == "x" && gameValues[i + 1] == "x" && gameValues[i + 2] == "x") {
        addWinner("x");
        winnerCells = [i, i + 1, i + 2];
        break;
      }
    }

    // Vertical Check
    for (int i = 0; i < 3; i++) {
      if (gameValues[i] == "o" && gameValues[i + 3] == "o" && gameValues[i + 6] == "o") {
        addWinner("o");
        winnerCells = [i, i + 3, i + 6];
        break;
      }
      if (gameValues[i] == "x" && gameValues[i + 3] == "x" && gameValues[i + 6] == "x") {
        addWinner("x");
        winnerCells = [i, i + 3, i + 6];
        break;
      }
    }

    // Diagonal Check
    if (gameValues[0] == "o" && gameValues[4] == "o" && gameValues[8] == "o") {
      addWinner("o");
      winnerCells = [0, 4, 8];
    }
    if (gameValues[0] == "x" && gameValues[4] == "x" && gameValues[8] == "x") {
      addWinner("x");
      winnerCells = [0, 4, 8];
    }
    if (gameValues[2] == "o" && gameValues[4] == "o" && gameValues[6] == "o") {
      addWinner("o");
      winnerCells = [2, 4, 6];
    }
    if (gameValues[2] == "x" && gameValues[4] == "x" && gameValues[6] == "x") {
      addWinner("x");
      winnerCells = [2, 4, 6];
    }

    update();
  }

  robotPlayInEasyLevel(){
    int randomPlay = 0;
    do {
      Random randomNumber = new Random();
      randomPlay = randomNumber.nextInt(9);
      if(!activeCells.contains(randomPlay)){
        break;
      }
    }while(true);
    activeCell(randomPlay);
    addValue(randomPlay);
    changePlayerTurn();

    update();
  }



  robotPlayInHardLevel(){
    activeCell(bfsValue);
    addValue(bfsValue);
    changePlayerTurn();

    update();
  }

}
