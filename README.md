# Augen Bookstore
## 1. Installation
### 1.1 Run api
- Setup Postgres
- Update database connection in api/config/database.yml
- Migrate database
```
cd api
docker-compose run web rake db:create
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
```
- Start api
```
cd api
docker-compose up
```

**Notes**
- Create docker network
```
docker network create postgres_default
```
- Example of a config database for postgres installed on host machine
```
username: postgres
password: postgres
host: host.docker.internal
port: 5432
```
- You might need to remove Gemfile.lock
### 1.2 Run client
```
cd client
npm i
npm run start
```
**Notes**
- You might need to remove package-lock.json
### 1.3 Run test
- Api test
```
cd api
docker-compose run web rspec
```
- Client test
```
cd client
npm run test
```
## 2. Design
### 2.1 Api
- Is responsible for core business and expose Restful Apis returning Json.
- Use the idea of "fat model" and "skinny controller".
- Apart from traditional Rails structure, we add a services layer to manage Business Logic.
- **Bookstore service** 
> Search book and buy book.
- **Book service** 
> Supports to search book.
> We use Factory Method to provide a more flexible way of creating a specific implemenation of Book library.
- **Delivery service**
> Communicates with 3rd Delivery service and assigns delivery to BookOrder.
- We use rspec for backend tests. Tests are put in api/spec folder.
### 2.2 Client
- Responsible for rendering views and interacting with users.
- **LandingPage component**
> Supports search and display list of books.
- **DetailPopup component**
> Displays a selected book info and allows users to select Delivery Date and Shipping Option. When users click 'Buy', Order Infos will be sent to Api and saved to Database.

## 3. Time summary
- Design: 1 hour
- Api implementation: 4 hours
- Client implementation: 3 hours
- Testing: 0.5 hour
- Documentation: 0.5 hour


