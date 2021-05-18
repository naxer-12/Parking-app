# Parking App
Carpa is a parking Ios application which has following functionalities:-
- User is able to make their profile on the app with details such as their name, email, password, contact number and car plate number.
- User is able to add their profile picture as well.
- User is able to see available parking locations and book that location for a fixed interval of time.
- This application allows user to see all their previous parkings and could also edit the same.
- Location of their parked car with route from current location to the parking location is displayed.

## Team Members
- Maitri Modi (101318200)
- Jainam Shah (101277989)

## Division of Work

Maitri Modi | Jainam shah
------------|------------
Update Profile | Sign In, Sign Out
Delete Profile | Sign Up
View Parking | Add Parking 

## Entities
- User
  - UserID(PK)
  - Name
  - Password
  - Email
  - Contact number
  - Car plate number(FK)
  - Profile picture (optional)

- Parking
  - Parking ID(PK)
  - Building Code
  - Number of hours intended to park
  - Car plate number(FK)
  - Parking location
  - Date and time of parking

- Car
  - Car plate number(PK)





