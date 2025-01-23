## Inventory Order Microservice

This is an Inventory Microservice built with Node.js and TypeScript that uses MongoDB for data storage. The service manages inventory creation and inventory checks.

## Features/Technologies

MongoDB: For storing order and inventory data.

## Prerequisites

Before running the service, make sure you have the following installed:

Docker (for local development and running services like MongoDB)
Node.js (v14 or higher)
Yarn or npm (for managing dependencies)
TypeScript (for compiling the code)

## Installation

Clone the repository and install dependencies:

bash

git clone the repo
cd inventory-microservice
run npm install

## Docker Compose Setup

Ensure you have the necessary Docker services running for MongoDB. You can use the following docker-compose.yml to set up these services locally . credentials are changable depending on environments.

## Configuration

Create a .env file in the root of the project to define environment variables:

env

MONGO_URI=mongodb://root:passVerify@mongodb:27017/inventory
PORT=3000 for inventory

## Start All the services with Docker Compose:

`docker-compose up --build`

This will bring up MongoDB and Inventory services.

## API Endpoints

## INVENTORY ENDPOINTS

## Create Inventory Item

_POST inventory/items_

This endpoint communicates with the Inventory service via RabbitMQ to check if the requested stock is available.

## REQUEST Body:

json

{
"itemId": "item123",
"description":"sample desc",
"price":100,
"stockQuantity": 100
}

## RESPONSE:

json

{
"status": "success",
"itemId": "item123",
"quantity": 2,
}
If the stock is insufficient, the response would be:

json

{
"status": "insufficient stock",
"success": false,
}

## Update Inventory Item Stock

_PATCH inventory/items/:id/stock_

This endpoint communicates with the Inventory service to modify the requested item stockQuantity available.

## REQUEST Body:

json

{"stockQuantity":408}

RESPONSE:

{
"\_id": "672de5efa3dccf3d22f21593",
"name": "Spaghetti",
"description": "Indian made spaghtetti",
"stockQuantity": 408,
"\_v": 0
}

## Get Inventory Item

_GET inventory/items/672de5efa3dccf3d22f21593_

## RESPONSE :

{
"\_id": "672de5efa3dccf3d22f21593",
"name": "Spaghetti",
"description": "Indian made spaghtetti",
"stockQuantity": 408,
"\_v": 0
}
Logging
The service uses Winston for logging and stores logs in Elasticsearch for querying and visualization in Kibana.

Log Example
Winston logs in JSON format:

json

{
"message": "Stock updated for itemId: item123",
"level": "info",
"timestamp": "2023-10-01T00:00:00Z"
}
You can view logs in Kibana at http://localhost:5601.

Troubleshooting
If MongoDB fails to connect, ensure that the MongoDB container is running and that the correct URI is in your .env file.
