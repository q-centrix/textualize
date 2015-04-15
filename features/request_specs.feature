@increase_wait_time
Feature: Textualize CLI
  In order to serve a directory of json
  As a user of the textualize documentation framework
  I want to create a folder with json matching urls

  Scenario: Creating the server folder
    When I set up Textualize and run "textualize request_specs"
    Then the file "my-app/request_specs/get_recipies.rb" should contain:
    """
    describe 'GET recipies'
    """
