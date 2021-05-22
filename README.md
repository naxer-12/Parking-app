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

  -![ERD](https://user-images.githubusercontent.com/32859295/118658880-6e9e8b80-b80a-11eb-8ba6-bb08a501cdc6.png)

- Screen shots

   ## Sign in page
  <img width="602" alt="Sign-in page" src="https://user-images.githubusercontent.com/38577874/118697214-afa79780-b82c-11eb-821e-39e6db8a2873.png">
  
  
  
    ## User Registration
  <img width="321" alt="User registration" src="https://user-images.githubusercontent.com/38577874/118697259-bc2bf000-b82c-11eb-8363-f4872d4f3726.png">
  
  

    ## Parking List
  <img width="360" alt="Parking list" src="https://user-images.githubusercontent.com/38577874/118697283-c3eb9480-b82c-11eb-821f-94c3d754162b.png">
  
  

    ## Parking Details
  <img width="332" alt="Parking details" src="https://user-images.githubusercontent.com/38577874/118697314-cb12a280-b82c-11eb-8cfd-b234a3ac8caa.png">


    ## add to parking
   <img width="332" alt="Add to Parking" src="https://user-images.githubusercontent.com/32859295/118711755-91966300-b83d-11eb-8f90-de24cff9c19c.png">




