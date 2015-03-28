'use strict';

/**
 * @ngdoc function
 * @name dashPocClientApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the dashPocClientApp
 */
angular.module('dashPocClientApp')
  .controller('MainCtrl', function ($scope) {
    $scope.$watch('tracks', function(newVal) {
      if (angular.isUndefined(newVal)) {
        return;
      }
      // find out the metadata track
      for (var i = 0; i < $scope.tracks.length; i++) {
        if ($scope.tracks[i].kind === 'metadata') {
          $scope.metadata = $scope.tracks[i];
          $scope.metadata.mode = 'hidden';
          break;
        }
      }
    });
  });
