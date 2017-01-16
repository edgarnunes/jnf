function GetUsers($scope, $http) {
    // this is where the JSON from api.php is consumed
    $http.get('api.php/utilizadores?transform=1').
        success(function(data) {
            // here the data from the api is assigned to a variable named users
            $scope.users = data.utilizadores;
        });
}