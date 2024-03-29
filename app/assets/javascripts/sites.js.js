// Generated by CoffeeScript 1.8.0
var HangMan;

HangMan = angular.module("HangMan", ["ngRoute", "templates", "ui.bootstrap"]);

HangMan.config([
  "$routeProvider", "$locationProvider", function($routeProvider, $locationProvider) {
    $routeProvider.when('/', {
      templateUrl: "index.html",
      controller: "SitesCtrl"
    }).otherwise({
      redirectTo: "/"
    });
    return $locationProvider.html5Mode(true);
  }
]);

HangMan.controller("SitesCtrl", [
  "$scope", function($scope) {
    var bodyCount, correctCount;
    $scope.alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
    $scope.questions = [];
    $scope.secretWords = [];
    $scope.displayLetters = "";
    $scope.correctGuesses = "";
    $scope.hintOnes = [];
    $scope.hintTwos = [];
    $scope.letters = [];
    bodyCount = 0;
    correctCount = 0;
    $scope.showLetter = true;
    $scope.playButton = true;
    $scope.showHintOne = true;
    $scope.showHintTwo = true;
    $scope.showButtonHintOne = true;
    $scope.showButtonHintTwo = true;
    $scope.reset = true;
    $scope.initalQuestion = function() {
      $scope.questionHide = true;
      $scope.questions.push($scope.question);
      $scope.hideQuestion = true;
      return console.log("Brief Description", $scope.questions);
    };
    $scope.addWord = function() {
      $scope.buttonHide = true;
      $scope.secretWords.push($scope.secretWord);
      $scope.displayLetters = $scope.secretWords.join("");
      $scope.playButton = false;
      console.log("Word is:", $scope.secretWords);
      $scope.showLetter = false;
      return $scope.reset = false;
    };
    $scope.addHintOne = function() {
      $scope.hintOneHide = true;
      $scope.hintOnes.push($scope.hintOne);
      $scope.showButtonHintOne = false;
      return console.log("Hint One is:", $scope.hintOnes);
    };
    $scope.addHintTwo = function() {
      $scope.hintTwoHide = true;
      $scope.hintTwos.push($scope.hintTwo);
      $scope.showButtonHintTwo = false;
      return console.log("Hint Two is:", $scope.hintTwos);
    };
    $scope.clickHintOne = function() {
      return $scope.showHintOne = false;
    };
    $scope.clickHintTwo = function() {
      return $scope.showHintTwo = false;
    };
    $scope.CollapseCtrl = function() {
      return $scope.isCollapsed = true;
    };
    return $scope.getLetter = function(letter) {
      var checkWord, i, isLetter, isNotLetter, joinSecretWord;
      console.log("Pressed this letter:", letter);
      $scope.letters.push(letter);
      this.showLetter = true;
      checkWord = $scope.secretWords.join("");
      joinSecretWord = $scope.secretWords.join("");
      i = 0;
      isLetter = false;
      while (i < joinSecretWord.length) {
        if (joinSecretWord[i] === $scope.letters.join("")) {
          console.log("You successfully guess this letter:", joinSecretWord[i]);
          $scope.correctGuesses += joinSecretWord[i];
          console.log("correctGuesses:", $scope.correctGuesses);
          isLetter = true;
          correctCount++;
          i++;
          if (correctCount === joinSecretWord.length) {
            $scope.showLetter = true;
            $scope.won = true;
          }
        } else {
          isNotLetter = false;
          i++;
        }
      }
      if (!isLetter && !isNotLetter) {
        console.log("WILL DELETE 1 BODY PART");
        bodyCount++;
        console.log("Body Count:", bodyCount);
        if (bodyCount === 1) {
          $scope.head = true;
        }
        if (bodyCount === 2) {
          $scope.body = true;
        }
        if (bodyCount === 3) {
          $scope.leftArm = true;
        }
        if (bodyCount === 4) {
          $scope.rightArm = true;
        }
        if (bodyCount === 5) {
          $scope.leftLeg = true;
        }
        if (bodyCount === 6) {
          $scope.rightLeg = true;
          $scope.showLetter = true;
          $scope.lost = true;
          $scope.reset = false;
          console.log("You Lost");
        }
      }
      return $scope.letters = [];
    };
  }
]);

HangMan.config([
  "$httpProvider", function($httpProvider) {
    return $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  }
]);
