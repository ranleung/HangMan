# Define App and dependencies
HangMan = angular.module("HangMan", ["ngRoute", "templates","ui.bootstrap"])

# Setup the angular router
HangMan.config ["$routeProvider", "$locationProvider", ($routeProvider, $locationProvider) ->
	$routeProvider
		.when '/',
			templateUrl: "index.html",
			controller: "SitesCtrl"
	.otherwise
		redirectTo: "/"

	$locationProvider.html5Mode(true)

]

# Books Controller
HangMan.controller "SitesCtrl", ["$scope", ($scope) ->

	$scope.alphabets = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

	$scope.words = []
	$scope.hintOnes = []
	$scope.hintTwos = []
	$scope.letters = []

	$scope.playButton = true
	$scope.showHintOne = true
	$scope.showHintTwo = true
	$scope.showButtonHintOne = true
	$scope.showButtonHintTwo = true

	$scope.addWord = ->
		$scope.buttonHide = true
		$scope.words.push($scope.secretWord)
		$scope.playButton = false
		console.log("Word is:", $scope.words)

	$scope.addHintOne = ->
		$scope.hintOneHide = true
		$scope.hintOnes.push($scope.hintOne)
		$scope.showButtonHintOne = false
		console.log("Hint One is:", $scope.hintOnes)

	$scope.addHintTwo = ->
		$scope.hintTwoHide = true
		$scope.hintTwos.push($scope.hintTwo)
		$scope.showButtonHintTwo = false
		console.log("Hint Two is:", $scope.hintTwos)

	$scope.clickHintOne = ->
		$scope.showHintOne = false

	$scope.clickHintTwo = ->
		$scope.showHintTwo = false


	$scope.CollapseCtrl = ->
		$scope.isCollapsed = true

	$scope.getLetter = (letter)->
		console.log(letter)
		$scope.letters.push(letter)
		console.log($scope.letters)
		# remove it from the letters array so a user can't click it again
		this.showLetter = true




]


# Define Config for CSRF token
HangMan.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
