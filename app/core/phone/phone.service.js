'use strict';

angular.
  module('core.phone').
  factory('Phone', ['$resource',
    function($resource) {
      return $resource('phones/:nomeFile.json', {}, {
        query: {
          method: 'GET',
          params: {nomeFile: 'phones'},
          isArray: true
        },
        query_marcas: {
          method: 'GET',
          params: {nomeFile: 'marcas'},
          isArray: true
        }        
      });
    }
  ]);
