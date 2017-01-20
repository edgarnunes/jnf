'use strict';

angular.
  module('phonecatApp').
  config(['$locationProvider' ,'$routeProvider',
    function config($locationProvider, $routeProvider) {
      $locationProvider.hashPrefix('!');

      $routeProvider.
        when('/phones', {
          template: '<phone-list></phone-list>'
        }).
        when('/sobre-nos', {
          templateUrl: 'views/sobrenos.html'
        }).
        when('/onde-estamos', {
          templateUrl: 'views/ondeestamos.html'
        }).        
        when('/contactos', {
          templateUrl: 'views/contactos.html'
        }). 
        when('/phones/:phoneId', {
          template: '<phone-detail></phone-detail>'
        }).
        otherwise('/phones');
    }
  ]);
