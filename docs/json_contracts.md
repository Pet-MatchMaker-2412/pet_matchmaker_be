# JSON Contracts

## API Endpoints

### Recommended Animals

#### GET /api/v1/recommended_animals/:id

response:

```json
{
  "data": {
    "type": "recommended_animal",
    "id": 1,
    "attributes": {
      "name": "dachshund",
      "photo url": "https://photo.com/dachshund_photo"
    }
  }
}
```

### Users

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
    "id": 1,
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
      "id": 1,
      "attributes": {
        "text": "question?",
      },
      "relationships": {
        "answers": {
          "data": [
            {
              "id": 1,
              "type": "answer",
              "attributes": {
                "text": "answer"
              }
            }
          ]
        }
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
  "answer_ids": [1, 4, 6 ...]
}
```

response:

```json
{
  "data": {
    "type": "questionnaire_submission",
    "id": 1,
    "attributes": {
      "recommended_pet_id": 1,
    },
    "relationships": {
      "submission_answers": {
        "data": [
          {
            "id": 1,
            "type": "submission_answer",
            "attributes": {
              "answer_id": 1
            }
          }
        ]
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
      "id": 1,
      "attributes": {
        "recommended_pet_id": 1,
      },
      "relationships": {
        "submission_answers": {
          "data": [
            {
              "id": 1,
              "type": "submission_answer",
              "attributes": {
                "answer_id": 1
              }
            }
          ]
        }
      }
    }
  ]
}
```
