# JSON Contracts

## API Endpoints

### Recommended Animals

#### GET /api/v1/petfinder_animals

request:

```json
{
  "recommended_animal_id": 1,
  "zipcode": "07097"
}
```

response:

```json
{
  "data": [
    {
      "type": "petfinder_animal",
      "id": "1",
      "attributes": {
        "name": "Spot",
        "photo_url": "https://photos.petfinder.com/photos/pets/42706540/1/?bust=1546042081",
        "age": "Young",
        "gender": "Male",
        "size": "Medium",
        "species": "Dog",
        "city": "Jersey City",
        "state": "NJ",
        "description": "Spot is an amazing dog",
        "email": "petfindertechsupport@gmail.com"
      }
    }
  ]
}
```

### Users

#### GET /api/v1/users

body:

```json
{
  "username": "something_unique"
}
```

response:

```json
{
  "data": {
    "type": "user",
    "id": "1",
    "attributes": {
      "username": "something_unique"
    }
  }
}
```

#### POST /api/v1/users

body:

```json
{
  "username": "something_unique"
}
```

response:

```json
{
  "data": {
    "type": "user",
    "id": "1",
    "attributes": {
      "username": "something_unique"
    }
  }
}
```

### Questions

#### GET /api/v1/questions

response:

```json
{
  "data": [
    {
      "type": "question",
      "id": "1",
      "attributes": {
        "text": "question?",
        "answers": [
          {
            "id": "1",
            "type": "answer",
            "attributes": {
              "text": "answer"
            }
          }
        ]
      }
    }
  ]
}
```

### Questionnaire Submission

#### POST /api/v1/users/:user_id/questionnaire_submissions

body:

```json
{
  "answer_ids": [1, 4, 6]
}
```

response:

```json
{
  "data": {
    "type": "questionnaire_submission",
    "id": "1",
    "attributes": {
      "submission_answers": [
        {
          "id": "1",
          "type": "submission_answer",
          "attributes": {
            "answer_id": "1"
          }
        }
      ],
      "recommended_animal": {
        "type": "recommended_animal",
        "id": "1",
        "attributes": {
          "animal_type": "dachshund",
          "photo_url": "https://photos.com/dachshund"
        }
      }
    }
  }
}
```

#### GET /api/v1/users/:user_id/questionnaire_submissions

response:

```json
{
  "data": [
    {
      "type": "questionnaire_submission",
      "id": "1",
      "attributes": {
        "submission_answers": [
          {
            "id": "1",
            "type": "submission_answer",
            "attributes": {
              "answer_id": "1"
            }
          }
        ],
        "recommended_animal": {
          "type": "recommended_animal",
          "id": "1",
          "attributes": {
            "animal_type": "dachshund",
            "photo_url": "https://photos.com/dachshund"
          }
        }
      }
    }
  ]
}
```
