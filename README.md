# FruitAppV2
This app is about retrieving list of apps from an API and populate it in UI. 
On clicking any fruit would take you to a screen to show more details of the selected Fruit.

To build the app I have used a table view inside a View , a navigation controller for navigating between the screens.

Technical Design : I have used MVC design pattern and have segregated the concerns Network request , datasource related logic in Model, 
views using storyboard and ensured that the view controller is not bloated. The Fruit model extending Decodable 
with properties is created to map the attributes from the API data

Unit testing:
I have created the mock stubs for testing the API to get fruit data and the corresponding test cases in getting the data. 
