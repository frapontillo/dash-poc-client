'use strict';

/**
 * @ngdoc directive
 * @name dashPocClientApp.directive:videoDash
 * @description
 * # videoDash
 */
angular.module('dashPocClientApp')
  .directive('videoDash', function () {
    return {
      restrict: 'A',
      scope: {
        tracks: '=',
        track: '=',
        sources: '=',
        source: '=',
        metadata: '='
      },
      link: function postLink(scope, element, attrs) {
        var video = element[0];
        var metadataTrack;

        if (video.nodeName.toLowerCase() !== 'video' || attrs.is.search('video-dash') < 0) {
          return;
        }

        var updateTracks = function() {
          // update the tracks
          scope.tracks = video.textTracks;

          if (!video.textTracks) {
            return;
          }

          // cancel the cue change listener, if any
          if (angular.isDefined(metadataTrack)) {
            metadataTrack.oncuechange = undefined;
            metadataTrack = undefined;
          }

          // find out the new metadata track
          for (var i = 0; i < video.textTracks.length; i++) {
            if (video.textTracks.item(i).kind === 'metadata') {
              metadataTrack = video.textTracks.item(i);
              break;
            }
          }

          // if there is a metadata track, set up a cuechange listener
          if (angular.isDefined(metadataTrack)) {
            metadataTrack.oncuechange = function () {
              // TODO: understand why it never enters here
              // "this" is a textTrack
              var cue = this.activeCues[0];
              scope.metadata = angular.fromJson(cue.text);
              scope.$apply();
            };
          }
        };

        var updateSources = function() {
          scope.sources = video.sourceTracks;
        };

        var enableTrack = function(index) {
          disableAllTracks();
          video.textTracks.item(index).mode = 'showing';
          return index;
        };

        var enableSource = function(index) {
          video.setSource(video.sourceTracks[index].src);
          return index;
        };

        var updateEnabledTrack = function() {
          for (var index = 0; index < video.textTracks.length; index++) {
            if (video.textTracks.item(index).mode === 'showing') {
              scope.track = index;
              return index;
            }
          }
        };

        var updateEnabledSource = function() {
          if (!video.sourceTracks){
            return;
          }
          for (var index = 0; index < video.sourceTracks.length; index++) {
            if (video.sourceTracks[index].src === video.lastStreamSource) {
              scope.source = index;
              return index;
            }
          }
        };

        var disableAllTracks = function() {
          for (var index = 0; index < video.textTracks.length; index++) {
            if (video.textTracks.item(index).kind === 'subtitles' || video.textTracks.item(index).kind === 'captions') {
              video.textTracks.item(index).mode = 'disabled';
            }
          }
        };

        var doInApply = function(fn) {
          return function () {
            return scope.$apply(fn);
          };
        };

        video.textTracks.onaddtrack = updateTracks;
        video.textTracks.onremovetrack = updateTracks;

        video.addEventListener('loadedmetadata', doInApply(updateEnabledTrack));
        video.addEventListener('canplay', doInApply(updateEnabledTrack));
        video.addEventListener('play', doInApply(updateEnabledTrack));

        video.addEventListener('loadedmetadata', doInApply(updateEnabledSource));
        video.addEventListener('canplay', doInApply(updateEnabledSource));
        video.addEventListener('play', doInApply(updateEnabledSource));

        scope.$watch('track', function(newValue) {
          if (typeof newValue === 'undefined') {
            return;
          }
          if (newValue === -1) {
            disableAllTracks();
            return;
          }
          console.info('Changing to track %s', newValue);
          enableTrack(newValue);
        });

        scope.$watch('source', function(newValue) {
          if (typeof newValue === 'undefined') {
            return;
          }
          console.info('Changing to source %s', newValue);
          enableSource(newValue);
        });

        scope.$on('$destroy', function() {
          video.textTracks.onaddtrack = undefined;
          video.textTracks.onremovetrack = undefined;
        });

        updateTracks();
        updateEnabledTrack();

        updateSources();
        updateEnabledSource();
      }
    };
  });
