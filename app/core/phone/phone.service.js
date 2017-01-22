'use strict';

angular.
  module('core.phone').
  factory('Phone', ['$resource',
    function($resource) {
  //   return $resource('phones/:nomeFile.json', {}, {
      return $resource('api.php/:nomeFile?:opcoes', {}, {
  //  return $resource('api.php/:nomeFile', {}, {
        query: {
          method: 'GET',
          params: {nomeFile: 'phones', opcoes: 'transform=1'},
          isArray: true
        },
        query_marcas: {
          method: 'GET',
          params: {nomeFile: 'marcas', opcoes: 'transform=1'},

         //comentar para funcionar com o objeto 
      //  isArray: true
        } ,
        query_modelos: {
          method: 'GET',
          //params: {nomeFile: 'modelos', opcoes: 'transform=1&filter=modelos.id_marca,eq,4'}
          params: {nomeFile: 'modelos', opcoes: 'transform=1'}

         //comentar para funcionar com o objeto 
      //  isArray: true
        },
        query_equipamentos : {
          method: 'GET',
          params: {nomeFile: 'equipamentos', opcoes: 'transform=1&include=marcas,modelos'} 
          //isArray: true         
        }        
      });
    }
  ]);
