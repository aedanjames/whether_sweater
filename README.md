# Whether Sweater (Sweater Weather)

## Table of Contents 
- [Overview](#overview)
- [Goals Achieved](#goals-achieved)
- [Configuration](#configuration)
- [How To Use](#how-to-use)
- [Endpoints](#endpoints)
- [Contributors](#contributors)
- [Database Design](#database-design)
- [User Stories](#user-stories)
- [Phases](#phases)

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

## Endpoints
* Base URL 
- Retrieve Weather For a City
GET 

## Developer

👤 **Aedan Yturralde** 
- [GitHub](https://github.com/aedanjames)
- [LinkedIn](https://www.linkedin.com/in/aedan-y/)


## Setup for the use of the project

1. A conveyor belt link will be sent out at project kickoff so that you can both fork and copy the project board on this base repo. 

## Local Setup for any other use

1. Fork and Clone the repo
2. Install gem packages: `bundle install`
3. Setup the database: `rails db:create`


## Versions

- Ruby 2.7.2

- Rails 5.2.6
