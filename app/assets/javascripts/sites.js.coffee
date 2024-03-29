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

	$scope.questions = []
	$scope.secretWords = []
	$scope.displayLetters = ""
	$scope.correctGuesses = ""
	$scope.hintOnes = []
	$scope.hintTwos = []
	$scope.letters = []
	bodyCount = 0
	correctCount = 0

	$scope.showLetter = true
	$scope.playButton = true
	$scope.showHintOne = true
	$scope.showHintTwo = true
	$scope.showButtonHintOne = true
	$scope.showButtonHintTwo = true
	$scope.reset = true

	$scope.initalQuestion = ->
		# Ask user for the question/description
		$scope.questionHide = true
		$scope.questions.push($scope.question)
		$scope.hideQuestion = true
		console.log("Brief Description", $scope.questions)

	$scope.addWord = ->
		# Add the word to the array
		$scope.buttonHide = true
		$scope.secretWords.push($scope.secretWord)
		$scope.displayLetters = $scope.secretWords.join("")
		$scope.playButton = false
		console.log("Word is:", $scope.secretWords)
		$scope.showLetter = false
		$scope.reset = false

	$scope.addHintOne = ->
		# Let player1 add hint 1
		$scope.hintOneHide = true
		$scope.hintOnes.push($scope.hintOne)
		$scope.showButtonHintOne = false
		console.log("Hint One is:", $scope.hintOnes)

	$scope.addHintTwo = ->
		# Let player1 add hint 2
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
		console.log("Pressed this letter:", letter)
		$scope.letters.push(letter)
		# remove it from the letters array so a user can't click it again
		this.showLetter = true
		checkWord = $scope.secretWords.join("")
		joinSecretWord = $scope.secretWords.join("")
		i = 0
		isLetter = false
		# Check to see if the word is successfully guess
		while i < joinSecretWord.length
			if joinSecretWord[i] is $scope.letters.join("")
				console.log "You successfully guess this letter:", joinSecretWord[i]
				$scope.correctGuesses += joinSecretWord[i]
				console.log("correctGuesses:",$scope.correctGuesses)
				# $scope.correct_answer = true
				isLetter = true
				correctCount++
				i++
				# Check to see if there is a winner
				if correctCount is joinSecretWord.length
					$scope.showLetter = true
					$scope.won = true
			# if the letter is not guessed correctly
			else
				isNotLetter = false
				i++
		# if not guessed properly, delete a body part
		if !isLetter && !isNotLetter
			console.log "WILL DELETE 1 BODY PART"
			bodyCount++
			console.log("Body Count:", bodyCount)
			$scope.head = true if bodyCount is 1
			$scope.body = true if bodyCount is 2
			$scope.leftArm = true if bodyCount is 3
			$scope.rightArm = true if bodyCount is 4
			$scope.leftLeg = true if bodyCount is 5
			if bodyCount is 6
				$scope.rightLeg = true
				$scope.showLetter = true
				$scope.lost = true
				$scope.reset = false
				console.log("You Lost")
		$scope.letters = []

]


# Define Config for CSRF token
HangMan.config ["$httpProvider", ($httpProvider)->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
