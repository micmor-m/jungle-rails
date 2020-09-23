# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Final Product
!["Screenshot of main page"]()
!["Screenshot of appointment form"]()
!["Screenshot of appointment form with input valdation"]()
!["Screenshot of confirmation message"]()
!["Screenshot of error message"]()

### Behaviour
- The user:
Can browse all products and add any of them to the carts and pay without login.
But it's also possible for a user to sign-up for a better experience.

Move from one page to another is easy using the top navigation bar.
On top of each page, there is a message if there is any sale ongoing.
If a product is no longer available a SOLD-OUT label will indicate it.

- The admin:
has the same feature of a general user, also, after login as Administrator gain access to more pages where new products and categories, with full details, can be added to the shop.
