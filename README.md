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
Add Parking | Sign In, Sign Out, Sign up
Parking List | Update profile
View Parking | Delete profile



## WE HAVE DECIDED TO USE CORE DATA BASED ON GIVEN REQUIREMENTS 


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


- ERD

![erd](https://user-images.githubusercontent.com/32859295/119567722-4abee500-bdca-11eb-9854-edd3b2a920b5.png)


- Screen shots

   ## Sign in page
     <img style="-webkit-user-select: none;margin: auto;cursor: zoom-in;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src="https://user-images.githubusercontent.com/38577874/119565318-7391ab00-bdc7-11eb-9eb0-9b05451fb455.png" width="250" height="500">
  
    ## User Registration
     <img style="-webkit-user-select: none;margin: auto;cursor: zoom-in;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src="https://user-images.githubusercontent.com/38577874/119565371-7e4c4000-bdc7-11eb-9db8-0b1cb5d162a9.png" width="250" height="500">

    ## Parking List
     <img style="-webkit-user-select: none;margin: auto;cursor: zoom-in;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src="https://user-images.githubusercontent.com/38577874/119565540-b5baec80-bdc7-11eb-82e5-28540ea5c7af.png" width="250" height="500">
     
    ## Parking Details
     <img style="-webkit-user-select: none;margin: auto;cursor: zoom-in;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src="https://user-images.githubusercontent.com/38577874/119565412-899f6b80-bdc7-11eb-96c8-abc358872dfe.png" width="250" height="500">

   ## Add Parking
     <img style="-webkit-user-select: none;margin: auto;cursor: zoom-in;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src="https://user-images.githubusercontent.com/38577874/119565453-94f29700-bdc7-11eb-8a0c-6b7d87b7d997.png" width="250" height="500">

   ## User Settings
     <img style="-webkit-user-select: none;margin: auto;cursor: zoom-in;background-color: hsl(0, 0%, 90%);transition: background-color 300ms;" src="https://user-images.githubusercontent.com/38577874/119565526-adfb4800-bdc7-11eb-92ab-e2dbe53e514a.png" width="250" height="500">


