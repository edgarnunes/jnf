function GetModelos($scope, $http) {
    // this is where the JSON from api.php is consumed
    $http.get('api.php/modelos?transform=1').
        success(function(data) {
            // here the data from the api is assigned to a variable named users
            $scope.modelos = data.modelos;
        });
}