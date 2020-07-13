[title]: # (Actions)
[tags]: # (api)
[priority]: # (2)
# Actions

Actions can be retrieved from the instance through either a GetAll call or by requesting a specific itemId.

## actions/GetAll

GET method to request all actions currently available on your Privilege Manager instance.

```json
GET /api/v1/actions/GetAll
{ }
```

## actions/{itemsId}

GET method to request a specific action.

```json
GET /api/v1/actions/{itemId}
```

| Parameter | Value |
| ----- | ----- |
| itemId | A 32-bit character string representing a specific action, for example: `54bfa458-bdfc-4e1b-8033-9c7888179f6c`. This represents the __Add Administrative Rights__ action in Privilege Manager. |
