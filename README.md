# Mobile Code Challenge Flutter Solution

<img src="https://img.shields.io/badge/made%20with-dart-blue.svg" alt="made with dart">

The task is to implement a food delivery app to let the user browse meals and add meals to his favourite page and to add meals to cart.

## Screenshots
<img src="https://github.com/Abdullah-Jacksi/food_delivery_app_case_study/blob/master/screenshots/1.jpeg" width="200" /> <img src="https://github.com/Abdullah-Jacksi/food_delivery_app_case_study/blob/master/screenshots/2.jpeg" width="200" /> <img src="https://github.com/Abdullah-Jacksi/food_delivery_app_case_study/blob/master/screenshots/3.jpeg" width="200" /> <img src="https://github.com/Abdullah-Jacksi/food_delivery_app_case_study/blob/master/screenshots/4.jpeg" width="200" />


## What has been implemented
The basic features that are fulfilled include:

- [x] As a User I should be able to browse categories.
- [x] As a User I should be able to browse click on a category from categories screen and show me the category meals.
- [x] As a User I should be able to save any meal into my favourite section.
- [x] As a User I should be able to add any meal into my cart section.
- [x] As a User I should be able to delete any meal from my cart section.
- [x] As a User I should be able to delete any meal from my favourite section.



## Folder Structure
```bash
.
├── core
│   ├── constants
│   ├── models
│   ├── data
│   ├── domain
│   └── view_models
├── ui
│   ├── utils
│   ├── views
│   └── widgets
└── config

```

## Folder Structure explanation
The lib folder is divided into three folders; core, ui, and config. Core contains all the files associated with the logic. Ui contains all the files associated with the ui. Config is for configurations.

* core
    * constants
        * Holds app constants and enums and routes.
    * models
        * Contains all the plain data models.
    * data
        * This layer interacts directly with an API (REST API or a local database).
    * domain
        * This layer transforms or manipulates the data that the API or local database provides.
    * view_models
        * This layer manages the state (Business logic layer). contains a view model for each view which will act as an interface between a view and domains.
    
* ui
    * utils
        * Contains functions or constants that are used in multiple other UI files.
    * views
        * Contains the main app screens.
    * widgets
        * Contains widget files that are too big to keep in the view files.
        * Usually contains shared widgets that are classes extending stateless widgets.

* config
    * configuration files for routing, providers, locators and functions (Usually contains shared functions that are classes use them)


## What could be improved?
1. Writing Unit tests.
2. Add meal details screen.
3. improve cart screen by adding quantity number for each meal and increase and decrease buttons for quantity number.
4. Add dark theme to the app.


## Plugins used ##
- provider: ^6.0.3                   // for state management
- http: ^0.13.4 _____________________// HTTP requests
- cached_network_image: ^3.2.1_______// to show and cache images
- shared_preferences: ^2.0.15________// as local database
- equatable: ^2.0.0__________________// to compare objects
- get_it: ^7.2.0_____________________// for dependency injection



## How to run ##
- Run `flutter packages get` to download pubspec dependencies.
- Run `flutter clean` for most of the first-run errors you may face.
- Run `flutter run` to try it live on a running emulator or USB connected device.
- You can target a specific device to run by running `flutter devices` and getting the id and running `flutter run -d <device_id>`.
- Run `flutter build apk` to generate the APK file.
- Run `flutter build ios` to package the iOS app.
