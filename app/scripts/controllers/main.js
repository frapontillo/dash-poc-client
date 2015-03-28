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
    $scope.getShieldUrl = function(license) {
      return 'https://img.shields.io/badge/license-' + license.replace(/-/g, '--') + '-lightgrey.svg?style=flat-square';
    };

    $scope.getLicenseUrl = function(license) {
      return 'https://spdx.org/licenses/' + license;
    };

    $scope.isFullScreen = false;

    $scope.toggleFullScreen = function() {
      $scope.isFullScreen = !$scope.isFullScreen;
    };
  });
