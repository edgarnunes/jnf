'use strict';

angular.
  module('core.phone').
  factory('Phone', ['$resource',
    function($resource) {
  //   return $resource('phones/:nomeFile.json', {}, {
      return $resource('api.php/:nomeFile?transform=1', {}, {
        query: {
          method: 'GET',
          params: {nomeFile: 'phones'},
          isArray: true
        },
        query_marcas: {
          method: 'GET',
          params: {nomeFile: 'marcas'},

         //comentar para funcionar com o objeto 
      //  isArray: true
        }        
      });
    }
  ]);
