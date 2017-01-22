'use strict';

// Register `phoneList` component, along with its associated controller and template
angular.
  module('phoneList').
  component('phoneList',{
    templateUrl: 'phone-list/phone-list.template.html',
    controller: ['Phone','$scope',
      function PhoneListController(Phone, $scope) {
        //this.phones = Phone.query();
        this.marcas = Phone.query_marcas();
        
        //console.log("---",Phone.query_marcas());
        this.orderProp = 'age';
        //console.log(this);       

        this.getMarcas = function(){ 
          console.log(this.marca_escolhida); 
          this.modelos = Phone.query_modelos(this.marca_escolhida);
          //return 2222;
        }

        this.equipamentos = Phone.query_equipamentos();
        console.log(this.equipamentos.equipamentos);
      }
    ]
  });
