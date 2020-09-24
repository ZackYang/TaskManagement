# TaskManagement

## A brief introduction

> bundle install

##### Please rename and adjust the database config file
> mv ./config/database.yml.example ./config/database.yml

> vim  ./config/database.yml

My personal database is postgresql 

> rails db:create db:migrate db:seed RAILS_ENV=production

Please be patient, the seed file will create **2 million entries** in the database, this will spend about 20 seconds.

> RAILS_ENV=production rails s

Current two API end-points are :

http://localhost:3000/api/v1/tasks
- http://localhost:3000/api/v1/tasks?filter[when]=future
- http://localhost:3000/api/v1/tasks?filter[when]=past

http://localhost:3000/api/v1/employees
 -    http://localhost:3000/api/v1/employees?filter[status]=training
 -   http://localhost:3000/api/v1/employees?filter[status]=activated

At the end of the responsed JSON, we can find the pagination info.
For Example:
 ```json
    "links": {
    		"first": "http://localhost:3000/api/v1/employees?page%5Blimit%5D=20&page%5Boffset%5D=0",
    		"next": "http://localhost:3000/api/v1/employees?page%5Blimit%5D=20&page%5Boffset%5D=20",
    		"last": "http://localhost:3000/api/v1/employees?page%5Blimit%5D=20&page%5Boffset%5D=80"
     }
```
