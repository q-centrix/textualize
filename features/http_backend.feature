@increase_wait_time
Feature: Textualize CLI
  In order to serve a directory of json
  As a user of the textualize documentation framework
  I want to create a folder with json matching urls

  Scenario: Creating the server folder
    When I set up Textualize and run "textualize http_backend"
    Then the file "my-app/dist/base/angular/backend/fake_http_backend.min.js" should contain:
    """
    whenGET('/api/v1/items/1')
    """

