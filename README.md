# Deadly Locks Hair Boutique
#### Ruby, Sinatra, PostGres SQL
#### USER STORIES

 * As a salon owner, I want to view, add, update and delete stylists.
 * As a salon owner, I want to view, add, update and delete clients.
 * As a salon owner, I want to add clients to a stylist.

#### Create Database

CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, first_name varchar, last_name varchar);
CREATE TABLE clients (id serial PRIMARY KEY, first_name varchar, last_name varchar, stylist_id int);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;


##### Licence

License Copyright (c) 2016 Brian Grant
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.



##User Stories

As a salon owner I want to view, add, delete stylists
