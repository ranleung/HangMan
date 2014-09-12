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

	$scope.addWord = ->
		$scope.buttonHide = true
		$scope.words.push($scope.secretWord)

	$scope.addHintOne = ->
		$scope.hintOneHide = true
		$scope.hintOnes.push($scope.hintOne)

	$scope.addHintTwo = ->
		$scope.hintTwoHide = true
		$scope.hintTwos.push($scope.hintTwo)



]


# Define Config for CSRF token
HangMan.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
