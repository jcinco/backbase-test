# iOS Assignment

## Orientation State Handling
The orientation state detection is handled by the AppDelegate. The AppDelegate tells the main view controller the current orientation state and it then reacts accordingly. The main view controller is an instance of UINavigationController, each time there is an orientation change, the main view controller replaces its root view controller with the appropriate view for portrait or landscape. 

### 1. Portrait mode
- The main view controller pushes the Map view controller when a city is selected, or the About view controller when the "about button" is tapped.

### 2. Landscape mode
- The main view controller only pushes the about view controller at this mode since both the selection view and map are shown in a split layout already.

## Data Handling
The approach I used to load and persist the JSON data during the lifetime of the application is loading and storing the contents into a singleton model. The application is build using MVC / MVVM design. 

### 1. Loading of JSON data
- The JSON data is loaded at first run asynchronously to avoid lagging the main thread since the data is huge. 
- The loading view controller ( city selection view ) is notified by the model after the JSON data is read. A success or fail boolean parameter is passed to the callback so that the view controller can behave accordingly, depending on the outcome.
- During loading, the JSON data is mapped to struct objects to represent them in Swift code. These are stored in the model as an array of City structs. 

### 2. Searching 
- Searching is done asynchronously to avoid UI performance lag when typing on the search bar.
- Since searching is done asynchronously, I utilized NotificationCenter to post notifications to an observing view controller each time there is an update.
- In searching for a match, I used ```array.filter()``` API.

### 3. Keeping data consistent
- All data states are persisted in the model. i.e. selected city, map coordinates. Since all view models are singleton, view controllers are only concerned of displaying the data appropriately. 
- Business logic are done in the view model.


