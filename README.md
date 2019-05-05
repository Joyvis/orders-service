# PITZI_ORDERS_SERVICE

## With Docker

* Clone repository
* Use the command ´´docker-compose up -d´´
* After, use the follow commands
* ´´docker-compose run pitzi_orders_service rake db:create´´
* ´´docker-compose run pitzi_orders_service rake db:migrate´´

## Without Docker

* Clone repository
* After, user the follow commands
* ´´rake db:create´´
* ´´rake db:migrate´´
* ´´rails s -p 4000´´

FRONTEND: https://github.com/Joyvis/pitzi_orders_frontend
