angular.module('textualize_http_backend', ['ngMockE2E']).run([
  '$httpBackend',
  function($httpBackend) {
    $httpBackend.whenGET(/^app\//).passThrough();
    $httpBackend.whenGET(/^components\//).passThrough();
  }
]);
