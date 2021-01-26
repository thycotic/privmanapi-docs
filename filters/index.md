[title]: # (Filters)
[tags]: # (api)
[priority]: # (2)
# Filters

Filters can be retrieved from the instance through either a GetAll call or by requesting a specific itemId.

Refer to these scripts for examples:

* [Get all filters](../scripts/04a-get-all-filters.ps1)
* [Get user context filters](../scripts/05a-get-user-context-filters.ps1)

## filters/GetAll

GET method to request all filters currently available on your Privilege Manager instance.

```json
GET /api/v1/filters/GetAll
{ }
```

## filters/{itemsId}

GET method to request a specific filter.

```json
GET /api/v1/filters/{itemId}
```

| Parameter | Value |
| ----- | ----- |
| itemId | A 32-bit character string representing a specific filter, for example: `df207907-9f9a-4777-afea-ff786d5399f2`. This represents the __Administrative Rights Required Application Compatibility Filter​__ read-only filter template in Privilege Manager. |
