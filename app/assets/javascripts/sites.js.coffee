# Define App and dependencies
HangMan = angular.module("HangMan", ["ngRoute", "templates"])

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

	$scope.words = []
	$scope.hintOnes = []
	$scope.hintTwos = []

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




]


# Define Config for CSRF token
HangMan.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
