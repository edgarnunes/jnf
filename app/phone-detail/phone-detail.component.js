'use strict';

// Register `phoneDetail` component, along with its associated controller and template
angular.
  module('phoneDetail').
  component('phoneDetail', {
    templateUrl: 'phone-detail/phone-detail.template.html',
    controller: ['$routeParams', 'Phone',
      function PhoneDetailController($routeParams, Phone) {
        var self = this;
        self.equip = Phone.get({nomeFile: "equipamentos", id_eq: $routeParams.phoneId}, function(phone) {
          //self.setImage(phone.images[0]);
          //console.log("api.php/" + $routeParams.phoneId);
        });

        self.setImage = function setImage(imageUrl) {
          self.mainImageUrl = imageUrl;
        };
      }
    ]
  });
