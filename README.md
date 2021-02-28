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
### 1.2 Run client
```
cd client
npm i
npm run start
```
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
- Is responsible for core business and expose Restful apis with Json
- Use the idea of "fat model" and "skinny controller"
- Apart from traditional Rails structure, we add a services layer to manage business logic
- **BookManager service** 
> Search book and buy book
- **DeliveryManger service**
> Communicate with 3rd Delivery service and assign delivery to book order
- **GoogleBook service** 
> Is a specific book store implementation used in this demo. We can implement another one if needed.
### 2.2 Client
- Responsible for rendering views and interact with users
- **LandingPage component**
> Supports search and display list of books
- **DetailPoup component**
> Display a selected book info and allow user to select Delivery date and Ship option. When user click 'Buy', Order Infos will be sent to api and save to database

## 3. Time summary
- Design: 1 hour
- Api implementation: 4 hours
- Client implementation: 3 hours
- Testing: 0.5 hour
- Documentation: 0.5 hour


