# SUPERHEROES 🦸🏽‍♀️🦸🏽‍♀️🦸🏽‍♀️

In this lab we are creating a Superhero API that shows superheroes and their powers.

## Instructions

Clone the repository and go into the cloned repo:

```console
$ git clone git@github.com:meggiddy/superheroes.git
$ cd superheroes
```

To set up the backend dependencies, from the root directory, run:

```console
$ bundle install
$ rails db:migrate db:seed
```

To see how the React application and Rails API are interacting, you can run the
Rails application in one terminal by running:

```console
$ rails s
```
## Tests
Using Postman you can test the API on:

### GET /heroes

Return JSON data in the format below:

[  

{ "id": 1, "name": "Kamala Khan", "super_name": "Ms. Marvel" },  

{ "id": 2, "name": "Doreen Green", "super_name": "Squirrel Girl" },  

{ "id": 3, "name": "Gwen Stacy", "super_name": "Spider-Gwen" }

]

 

### GET /heroes/:id

If the `Hero` exists, return JSON data in the format below:

 

{

  "id": 1,

  "name": "Kamala Khan",

  "super_name": "Ms. Marvel",

  "powers": [

    {

      "id": 1,

      "name": "super strength",

      "description": "gives the wielder super-human strengths"

    },

    {

      "id": 2,

      "name": "flight",

      "description": "gives the wielder the ability to fly through the skies at supersonic speed"

    }

  ]

}

 

If the `Hero` does not exist, return the following JSON data, along with

the appropriate HTTP status code:

{   "error": "Hero not found" }

### GET /powers

Return JSON data in the format below:

 

[

  {

    "id": 1,

    "name": "super strength",

    "description": "gives the wielder super-human strengths"

  },

  {

    "id": 1,

    "name": "flight",

    "description": "gives the wielder the ability to fly through the skies at supersonic speed"

  }

]

 

### GET /powers/:id

If the `Power` exists, return JSON data in the format below:

```

{

  "id": 1,

  "name": "super strength",

  "description": "gives the wielder super-human strengths"

}

```

If the `Power` does not exist, return the following JSON data, along with

the appropriate HTTP status code:

```

{

  "error": "Power not found"

}

```

### PATCH /powers/:id

This route should update an existing `Power`. It should accept an object with

the following properties in the body of the request:

```

{

  "description": "Updated description"

}

```

If the `Power` exists and is updated successfully (passes validations), update

its description and return JSON data in the format below:

```

{

  "id": 1,

  "name": "super strength",

  "description": "Updated description"

}

```

If the `Power` does not exist, return the following JSON data, along with

the appropriate HTTP status code:

```

{

  "error": "Power not found"

}

```

If the `Power` is **not** updated successfully (does not pass validations),

return the following JSON data, along with the appropriate HTTP status code:

```

{

  "errors": ["validation errors"]

}

```

### POST /hero_powers

This route should create a new `HeroPower` that is associated with an

existing `Power` and `Hero`. It should accept an object with the following

properties in the body of the request:

```

{

  "strength": "Average",

  "power_id": 1,

  "hero_id": 3

}

```

If the `HeroPower` is created successfully, send back a response with the data

related to the `Hero`:

```

{

  "id": 1,

  "name": "Kamala Khan",

  "super_name": "Ms. Marvel",

  "powers": [

    {

      "id": 1,

      "name": "super strength",

      "description": "gives the wielder super-human strengths"

    },

    {

      "id": 2,

      "name": "flight",

      "description": "gives the wielder the ability to fly through the skies at supersonic speed"

    }

  ]

}

```

If the `HeroPower` is **not** created successfully, return the following

JSON data, along with the appropriate HTTP status code:

```

{

  "errors": ["validation errors"]

}

```
