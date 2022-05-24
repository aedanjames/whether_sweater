# Whether Sweater (Sweater Weather)

## Table of Contents 
- [Overview](#overview)
- [Goals Achieved](#goals-achieved)
- [Configuration](#configuration)
- [Endpoints](#table-of-endpoints)
- [Developer](#developer)
- [Versions](#versions)


## Overview
[Whether Sweater](https://github.com/aedanjames/whether_sweater) Whether Sweater is a Ruby on Rails Backend API based application. It follows restful convention and exposes endpoints for FE consumption. Current endpoints allow for a FE app to retrieve weather, and background images for a city. Register a user, to receive an API key, log in, and make a POST request to plan for road trips. 

## Goals Achieved    
* Expose API endpoints that provide unique functionality via interfacing response data from multiple 3rd party API requests. 
* Follow RESTFUL convention. 
* Provide useful error responses, with the intention of aiding FE developers' efforts to debug.

## Configuration 
|             |               |               |               |
|   :----:    |    :----:     |    :----:     |    :----:     |
| Ruby 2.7.x  | SQL           | SimpleCov     | Faraday       |
| Rails 5.2.x | Figaro        | bcrypt        | VSCode        |
| RSpec       | HTML5         | ShouldaMatcher| Webmock       |
| Pry         | Github        | Git           | VCR           |


## Table Of Endpoints
- [Base URL](#base-url)
- [Weather For a City](#weather)
- [Background Image For a City](#background)
- [Register User](#register-user)
- [Log In User](#log-in-user)
- [Create Road Trip](#create-road-trip)

### Base URL
* <em> *https://boiling-caverns-62909.herokuapp.com*</em>
### Weather
-<u>Retrieve Weather For a City</u>-
  - <h5>GET /api/v1/forecast</h5>
    - params[:location] required <br><br> 
    <u>Example Request</u><br> 
    <code>GET https://boiling-caverns-62909.herokuapp.com?/api/v1/forecast?location=Denver</code><br><br>
    <u>Example Response</u><br>
    
```
    {"data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-04-26T12:09:39.000-06:00",
                "temp": 67.46,
                "feels_like": 64.62,
                "humidity": 15,
                "sunrise": "2022-04-26T06:06:38.000-06:00",
                "sunset": "2022-04-26T19:48:30.000-06:00",
                "uvi": 8.75,
                "visibility": 10000,
                "conditions": "scattered clouds",
                "icon": "03d"
            },
            "daily_weather": [
                {
                    "datetime": "4515561-06-01",
                    "sunrise": "2022-04-26T06:06:38.000-06:00",
                    "sunset": "2022-04-26T19:48:30.000-06:00",
                    "max_temp": 72.27,
                    "min_temp": 43.52,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "datetime": "4515797-12-20",
                    "sunrise": "2022-04-27T06:05:20.000-06:00",
                    "sunset": "2022-04-27T19:49:30.000-06:00",
                    "max_temp": 73.35,
                    "min_temp": 53.29,
                    "conditions": "light rain",
                    "icon": "10d"
                },
                {
                    "datetime": "4516034-07-11",
                    "sunrise": "2022-04-28T06:04:02.000-06:00",
                    "sunset": "2022-04-28T19:50:31.000-06:00",
                    "max_temp": 75.58,
                    "min_temp": 52.59,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "datetime": "4516271-01-30",
                    "sunrise": "2022-04-29T06:02:46.000-06:00",
                    "sunset": "2022-04-29T19:51:32.000-06:00",
                    "max_temp": 61.54,
                    "min_temp": 51.82,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "datetime": "4516507-08-21",
                    "sunrise": "2022-04-30T06:01:31.000-06:00",
                    "sunset": "2022-04-30T19:52:33.000-06:00",
                    "max_temp": 66.78,
                    "min_temp": 47.16,
                    "conditions": "clear sky",
                    "icon": "01d"
                }
            ],
            "hourly_weather": [
                {
                    "time": "2022-04-26T12:00:00.000-06:00",
                    "temp": 67.46,
                    "conditions": "scattered clouds",
                    "icon": "03d"
                },
                {
                    "time": "2022-04-26T13:00:00.000-06:00",
                    "temp": 67.73,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "2022-04-26T14:00:00.000-06:00",
                    "temp": 69.51,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "2022-04-26T15:00:00.000-06:00",
                    "temp": 70.48,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "2022-04-26T16:00:00.000-06:00",
                    "temp": 71.26,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "time": "2022-04-26T17:00:00.000-06:00",
                    "temp": 71.71,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "2022-04-26T18:00:00.000-06:00",
                    "temp": 72.27,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "time": "2022-04-26T19:00:00.000-06:00",
                    "temp": 70.29,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                }
            ]
        }
    }
}
```

<u>Error Messages</u><br>
- Location param missing/empty, Status 401: 
<code>{"data": {"message": ":location param missing or empty"}}</code><br>
<br>

### Background
-<u>Retrieve Background Image For a City</u>-
  - <h5>GET /api/v1/backgrounds</h5>  
    - params[:location] required <br><br>
    <u>Example Request</u><br>
    <code>GET https://boiling-caverns-62909.herokuapp.com/api/v1/backgrounds?location=Denver</code><br><br>
    <u>Example Response</u><br>
```
    {"data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image": {
                "location": "denver",
                "image_url": "https://www.pexels.com/photo/union-station-building-2706750/"
            },
            "credit": {
                "source": "https://www.pexels.com/@thomasleeward",
                "author": "Thomas Ward",
                "logo": "https://images.pexels.com/photos/2706750/pexels-photo-2706750.jpeg?auto=compress&cs=tinysrgb&dpr=1&fit=crop&h=200&w=280"}}}}
```                
<br>
<u>Error Messages</u><br>
- Location param missing/empty, Status 401: 
<code>{"data": {"message": ":location param missing or empty"}}</code><br><br>

### Register User
- <u>Register User</u>
  - <h5>POST /api/v1/users</h5>  
  - :email, :password, :password_confirmation params expected in body <br>
```
{
  "email": "whatevs@example.com",
  "password": "password",
  "password_confirmation": "password"
} 
```
<br><br>
  <u>Example Request</u><br> <code>POST https://boiling-caverns-62909.herokuapp.com/api/v1/users</code><br><br>
  <u>Example Response, Status 201</u><br> 
```
{
    "data": {
        "type": "users",
        "id": 5,
        "attributes": {
            "email": "developer@example.com",
            "api_key": "YyiuB3t9uhg7rohcZXCPzzZYGAn"}}}</code><br>
<u>Error Messages</u><br>
- Email already taken, Status 401: 
<code>{"data": {"message": "Email has already been taken"}}</code><br><br>
- Passwords Don't Match, Status 401: 
<code>{"data": {"message": "Invalid Email/Password"}}
```

### Log In User
- <u>Log In Registered/Existing User</u>-
- <h5>POST /api/v1/sessions</h5>
- :email, :password params expected in body <br> 
```
{"email": "whatevs@example.com",
  "password": "password"}
```
<br><br>
<u>Example Request</u><br> <code>POST https://boiling-caverns-62909.herokuapp.com/api/v1/sessions</code><br><br>
  <u>Example Response, Status 201</u><br>
```
  {
    "data": {
        "type": "users",
        "id": 3,
        "attributes": {
            "email": "whatever@example.com",
            "api_key": "f3egaegagegh34ya34534523"}}}
```
<br><br>
<u>Error Messages</u><br>
- Invalid email/Password, Status 401: <code>{
    "data": {"message": "Invalid Email/Password"}</code><br>
### Create Road Trip
-<u>POST request to create a Road Trip</u>-
  - <h5>POST /api/v1/road_trip</h5>
    - :origin, :destination, :api_key params required <br><br> 
    <u>Example Request</u><br> 
    <code> GET https://boiling-caverns-62909.herokuapp.com?/api/v1/road_trip</code><br>
```
    body: {"origin": "New York, NY",
    "destination": "Los Angeles,CA","api_key": "XNzwMdZih8Tg98ehjdhn2SBA7rw"}
```    
<br><br>
    <u>Example Response, Status 200</u><br>
```
    {
      "data": {
        "id": null,
        "type": "roadtrip",
        "attributes": {
            "start_city": "New York, NY",
            "end_city": "Los Angeles, CA",
            "travel_time": "40:16:00",
            "weather_at_eta": {
                "temperature": 59.81,
                "conditions": "few clouds"}}}}
```
<br><br>
<u>Error Messages, Status 401</u><br>
- Invalid API Key
<code>{"data": {"message": "Invalid API Key"}}</code><br><br>
- Missing/empty origin or api_key params
<code>{ data: { message: ':origin or :api_key params missing or empty' } }</code><br><br>
- Missing/empty destination param
<code>{ data: { message: ':destination param missing or empty' } }</code><br><br>
- Impossible route (assuming amphibious vehicles aren't in play)
<code>{ data: { message: 'Impossible Route' } }</code>




## Developer

👤 **Aedan Yturralde** 
- [GitHub](https://github.com/aedanjames)
- [LinkedIn](https://www.linkedin.com/in/aedan-y/)


## Versions

- Ruby 2.7.2

- Rails 5.2.6
