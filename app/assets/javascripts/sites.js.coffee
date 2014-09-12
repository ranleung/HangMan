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
	$(window).load ->
	  $("#myModal").modal "show"
	  return

	$scope.words = []

	$scope.addWord = ->
		$scope.hide = true
		$scope.words.push($scope.secretWord)



]


# Define Config for CSRF token
HangMan.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
