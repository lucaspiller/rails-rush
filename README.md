# RailsRush

Rails 8 boilerplate for multi-tenant apps.

What's included:

* [Turbo](https://turbo.hotwired.dev/)
* [Stimulus](https://stimulus.hotwired.dev/)
* [Vite](https://vitejs.dev/) because #YESBUILD
* [Tailwind CSS](https://tailwindcss.com/) + [Flowbite](https://flowbite.com/)
* [Font Awesome icons](https://fontawesome.com/v6/search?o=r&m=free&s=solid)
* Database agnostic (uses SQLite by default)
* [UUIDv7](https://buildkite.com/resources/blog/goodbye-integers-hello-uuids/) as primary keys
* [Devise](https://github.com/heartcombo/devise) for authentication
* Docker + [Kamal](https://kamal-deploy.org/)
* CI (GitHub actions)
* Multi-tenancy out of the box (see below)

## Multi-tenancy

Multi-tenancy is built into RailsRush. User and account management is facilitated through three main models: __User__, __Account__, and __AccountUser__.

* __User__: Represents an individual who can log into the application. Each user can have multiple accounts associated with them.
* __Account__: Represents a distinct team or organisation within the application. Accounts can have multiple users associated with them, allowing for multi-tenancy.
* __AccountUser__: This is a join model that establishes the many-to-many relationship between users and accounts. It allows users to be linked to multiple accounts and vice versa. Users have a role for each account, allowing for role-based access control.

When you create additional models, they should probably _belong_to_ the __Account__ model.
