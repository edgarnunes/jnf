'use strict';

// Register `phoneList` component, along with its associated controller and template
angular.
  module('phoneList').
  component('phoneList', {
    templateUrl: 'phone-list/phone-list.template.html',
    controller: ['Phone',
      function PhoneListController(Phone) {
        //this.phones = Phone.query();
        this.marcas = Phone.query_marcas();
        console.log("---",Phone.query_marcas());
        this.orderProp = 'age';


      }
    ]
  });
