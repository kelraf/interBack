# InterBack Api

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit (baseUrl) [`localhost:4000/api/`](http://localhost:4000/api/) from your postman/insomnia.

##### _HOSTED API LINK [`https://inter-back.herokuapp.com/api/`](https://inter-back.herokuapp.com/api/)_
##### HOSTED PROJECT ONLINE [HEROKU SIMPLE REORDER MODULE UI LINK](https://inter-ui.herokuapp.com/welcome).

#### INTRO TO API
<i>
  The api can accept three types of users, Super User `role: 1`, store attendant `role: 3` and Warehouse attendant `role: 2` but the api allows you to user super user in place of warehouse attendant.

  The link to the hosted application on heroku is (baseUrl) I will use baseUrl to refer to the link in my examples 
  [`https://inter-back.herokuapp.com/api/`](https://inter-back.herokuapp.com/api/).

  By default the api has some data already pre-inserted and the data id superuser with the id of 2 and store attendant with the is of 1 you can access the users using `GET baseUrl/users/1`. To access all users in the database use `GET baseUrl/user`
</i>

##### LOGIN 
_To login to the api use `POST baseUrl/users/auth/login` and provide the data as shown below_
```yaml
{
	"user": {
		"email": "kelraf11746@gmail.com",
		"password": "kelraf"
	}
}
```
_use the exact data because this is a superuser in the api_

_The response is as below_

```yaml
{
  "message": "Login Successful.",
  "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJpbnRlckJhY2siLCJleHAiOjE2MzQyMDU1NzIsImlhdCI6MTYzMTc4NjM3MiwiaXNzIjoiaW50ZXJCYWNrIiwianRpIjoiNmFmNzlmYTEtMGE2NS00OTRiLTlkNjctYzI2ZmM1ODU4MjBjIiwibmJmIjoxNjMxNzg2MzcxLCJzdWIiOiIyIiwidHlwIjoiYWNjZXNzIn0.x9ETeq9TbTGfjw83_rinbCUSOKhoMmg2Xf3IoCPvUyBRBJ-0ZK6KWaxu8HfLY4G6Oj4sQemqdxgkbmx2UW4QNA",
  "user": {
    "email": "kelraf11746@gmail.com",
    "id": 2,
    "name": "kelvin Raphael",
    "password_confirmation": null,
    "role": 1
  }
}
```

_Take the toke and use it to access the rest of the endpoints since they are protected_

##### CREATING A STORE
_To create a store visit `POST baseUrl/stores` with the data as below_

```yaml
{
	"store": {
		"user_id": 1,
		"store_name": ""
	}
}
```
_There are other endpoints to work with stores as described in [`these section`](#stores)_


##### CREATE A STORE ATTENDANT
_Since now we have a store lets create a store attendant. We will first create user with the `role: 3` using the endpoint as `POST baseUrl/users/auth/register` and data as below_
```yaml
{
	"user": {
		"name": "kelvin Raphael",
		"email": "kelraf11746@gmail.com",
		"password": "kelraf",
		"role": 3 <bold> (Remember the roles here) <bold>,
		"password_confirmation": "kelraf"
	}
}
```
_We will then create a relationship between the user we just created and a store using the endpoint `POST baseUrl/storeattendants` and data as shown below_

```yaml
{
	"storeattendant": {
		"user_id": 2,
		"store_id": 1
	}
}
```

_You can see the rest of the endpoints to work with store attendants in [`these section`](#storeattendants)_


##### CREATING WAREHOUSE PRODUCT
_To add a product to warehouse you can use `POST baseUrl/warehouseproducts` with the data as shown below_
```yaml
{
	"warehouse_product": {
		"user_id": 2,
		"product_name": "Fanta",
		"category": "1 litre",
		"quantity": 9000
	}
}
```

_For more information about dealing with warehouse products see [`these section`](#warehouseproducts)_

##### DISPATCHING INNITIAL PRODUCT FROM WAREHOUSE TO A GIVEN STORE
_To dispatch innitial product from warahouse to a store use `POST baseUrl/storeproducts` with the data as shown below_

```yaml
{
	"store_product": {
		"user_id": 1,
		"store_id": 1,
		"quantity": 100,
		"min_quantity": 500,
		"warehouseproduct_id": 1
	}
}
```


_If the given data is valid, the api will deduct quantity of the product from the warehouse with the given warehouseproduct_id and add it to store products using insert. for more information about warking with Store products view [`these section`](#storeproducts)_

##### CREATING A SALE TO GENERATE A REORDER
_To auto generate a reorder visit `POST baseUrl/storesales` with the data as shown below_

```yaml
{
	"store_sale": {
		"user_id": 1,
		"storeproduct_id": 6,
		"quantity": 50,
		"warehouseproduct_id": 1,
		"store_id": 1
	}
}
```

_These is used to create a sale, To generate an auto reorder make sure that the quantity once deducted from the given store product with the given id as storeproduct_id with be below min_quantity set to the product whose id is given as storeproduct_id. To check the reorder generated visit `GET baseUrl/reorders`_


##### PROCESSING REORDERS
_To process reorders visit `PUT baseUrl/reorders/:id` with data as shown below_

```yaml

{
	"reorder": {
		"quantity": 50
	}
}

```

##### CHECKOUT THE REST OF THE ENDPOINTS
##### UNPROTECTED ENDPOINTS

- POST - baseUrl/users/auth/register -> To register a user
- POST - baseUrl/users/auth/login -> Login as a registered user

##### PROTECTED ENDPOINTS
##### _USERS_

- GET - baseUrl/users -> To get all users
- GET - baseUrl/users/:id -> To get user with a given id
- DELETE - baseUser/users/:id -> To Delete user with a given id

##### _STORES_ {#stores}

    *POST - baseUrl/stores -> To Create a store
    *GET - baseUrl/stores -> To get all stores
    *GET - baseUrl/stores/:id -> To get a store with a given id
    *PUT - baseUrl/stores/:id -> To update store with a given id
    *DELETE - baseUrl/stores/:id -> To delete store with a given id

##### _STORE ATTENDANTS_ {#storeattendants}

    *POST - baseUrl/storeattendants -> To Create a relationship between store and user
    *GET - baseUrl/storeattendants -> To get all relationships between stores and users
    *GET - baseUrl/storeattendants/:id -> To get a relationship between store and user of the given id
    *PUT - baseUrl/storeattendants/:id -> To update a relationship between store and user of the given id
    *DELETE - baseUrl/storeattendants/:id -> To delete a relationship between store and user of the given id

##### _WAREHOUSE PRODUCTS_ {#warehouseproducts}

    *POST - baseUrl/warehouseproducts -> To Create a warehouse product
    *GET - baseUrl/warehouseproducts -> To get all warehouse products
    *GET - baseUrl/warehouseproducts/:id -> To get a warehouse product with a given id
    *PUT - baseUrl/warehouseproducts/:id -> To update warehouse product with a given id
    *DELETE - baseUrl/warehouseproducts/:id -> To delete warehouse product with a given id

##### _STORE PRODUCTS_ {#storeproducts}

    *POST - baseUrl/storeproducts -> To Create a store products
    *GET - baseUrl/storeproducts -> To get all store products
    *GET - baseUrl/storeproducts/:id -> To get a store product with a given id
    *PUT - baseUrl/storeproducts/:id -> To update store product with a given id
    *DELETE - baseUrl/storeproducts/:id -> To delete store product with a given id
