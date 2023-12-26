# Foreign Exchange Currency Rates App (Flutter)

## Home Coding Assignment Objective:

- Build a Flutter app that fetches foreign exchange currency rates from an API.
- Create a screen for the current exchange rates fetched.
- Create a secondary screen for a specific currency history exchange rates
- Implement caching of the rates in a local database.
- Refresh the rates from the API every X seconds.

## Key Features:

- API Integration: Connects to a specified currency exchange API to retrieve real-time rates.
- Data Caching: Stores retrieved rates in a local database (SQLite is recommended) for the history page.
- Periodic Updates: Fetches fresh rates from the API every X seconds.

## App Flow:
- When the app is launched it will display a list of current currency exchange rates based on the data returned from the API.
- The list should refresh every X seconds based on the API response.
- All the data from the API should be cached locally on the device.
- When tapping on a specific currency you should be navigates to a secondary screen
- The secondary screen should display the specified currency history rates.

## API Documentation
| method | path | response |
|---|---|---|
| GET | /fx/current | list of currenct exchange rates and a timestamp |

#### base url: https:/sample-comments-service-5y6owysdhq-uc.a.run.app/

#### api-key: use this key in the header: {'api-key': '795cfec4-68b1-42d6-baa0-16a53ce09a1d'}

#### Curl: 
```
curl --location 'https://sample-comments-service-5y6owysdhq-uc.a.run.app/fx/current' \
--header 'api-key: 795cfec4-68b1-42d6-baa0-16a53ce09a1d'
```

## Evaluation:

### The assignment will be evaluated based on the following criteria:

- Functionality: The app should meet all the specified requirements and fetch, display, and cache currency rates correctly.
- Code Quality: The code should be well-structured, readable, and maintainable, following Flutter best practices.
- User Experience: The app should have a user-friendly and intuitive interface that is easy to navigate and understand.


## Submittion
- Once you are done coding, please zip the your project and send it.


#### Happy coding!