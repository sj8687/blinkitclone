
# .env 

    JWT_SECRET=blinkit-punelok
    DATABASE_URL=mongodb://localhost:27017/blinkit
    NODE_ENV=development
    PORT=3000
    JWT_EXPIRES_IN='10d'
    APP_URL=http://localhost:3000

## HOW TO RUN 
  --run this commands in your terminal 
      
    npm install
    npm run start:dev

## BASE URL 
  -- http://localhost:3000 

## Signup && signin END POINTS ------------------------------------------------------

*  POST /auth/signup

  --- PAYLOAD 

       {
          "email": "test3@gmail.com",
          "password": "StrongPassword@123"
       }

  --- RESPONSE

       {
          "id": "699ed0f0bf477cae866140b2",
          "email": "test5@gmail.com",
          "statusCode": 201
       }     

       if user alredy exist then 

  --- RESPONSE     

       {
          "id": "699ed0f0bf477cae866140b2",
          "email": "test5@gmail.com",
          "statusCode": 200,
          "Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2OTllZDBmMGJmNDc3Y2FlODY2MTQwYjIiLCJlbWFpbCI6InRlc3Q1QGdtYWlsLmNvbSIsImlhdCI6MTc3MjAxNjA0MCwiZXhwIjoxNzcyMDE2MTAwfQ.KjQj7u5PUDad5ggtWfebyMA-KHCnc0ig0VUY5kvpxH4"
       }

*  POST /auth/signin

  --- PAYLOAD 

       {
          "email": "test3@gmail.com",
          "password": "StrongPassword@123"
       }

  --- RESPONSE

       {
          "id": "699ed0f0bf477cae866140b2",
          "email": "test5@gmail.com",
          "statusCode": 201
       }     

       if user exist then 

  --- RESPONSE     

       {
          "id": "699ed0f0bf477cae866140b2",
          "email": "test5@gmail.com",
          "statusCode": 200,
          "Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2OTllZDBmMGJmNDc3Y2FlODY2MTQwYjIiLCJlbWFpbCI6InRlc3Q1QGdtYWlsLmNvbSIsImlhdCI6MTc3MjAxNjA0MCwiZXhwIjoxNzcyMDE2MTAwfQ.KjQj7u5PUDad5ggtWfebyMA-KHCnc0ig0VUY5kvpxH4"
       }


## cart -----------------------------------------------------------------------

 * POST cart/add

   --- PAYLOAD

      {
         "productName":"xyz2",
         "imageUrl":"https://image.com",
         "price":"12.00",
         "qty":1
      }

   --- RESPONSE

      {
         "message": "cart added successfully...",
         "statusCode": 201
      }

    * if already exist then

      {
         "message": "Product Already Exist...",
         "statusCode": 409
      }  

   *  if unauthorized then 

      {
         "message": "Unauthorized",
         "statusCode": 401
      }   