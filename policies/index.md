[title]: # (Policies)
[tags]: # (api)
[priority]: # (2)
# Policies

Policies can be retrieved from the instance through either a GetAll call or by requesting a specific itemId.

Policies can also be created via various available post methods.

Refer to these scripts for examples:

* [Get enabled policies](../scripts/03a-get-enabled-policies.ps1)
* [Post new Windows Policy](../scripts/05a-post-new-win-policy.ps1)

## GET

### policies/GetAll

GET method to request all policies currently available in your Privilege Manager instance.

```json
GET /api/v1/policies/GetAll
{ }
```

### policies/{itemsId}

GET method to request a specific policy from your Privilege Manager instance.

```json
GET /api/v1/policies/{itemId}
```

| Parameter | Value |
| ----- | ----- |
| itemId | A 32-bit character string representing a specific policy, for example: `44290cc3-9c86-4995-aa33-79b8ee74daf7`. This represents the __Elevate Privilege Manager Remove Programs Utility Policy​__ read-only policy template in Privilege Manager. |

## POST

### policies/new

POST method to create a new policy.

```json
POST /api/v1/policies/new
{
  "Name": "string",
  "Description": "string",
  "OS": "string"
}
```

| Parameter | Value |
| ----- | ----- |
| Name | Sensible name to easily find and place the newly created policy. |
| Description | Sensible description to correctly identify the newly created policy. |
| OS | This can be either `win` for Windows or `mac` for MacOS. |

### policies/{policyId}/add-filters

POST method to add filters to an existing policy.

```json
POST /api/v1/policies/{policyId}/add-filters
{
  "Filters": [
    {
      "Id": "string",
      "FilterRole": 1
    }
  ]
}
```

| Parameter | Value |
| ----- | ----- |
| Filters | An `Array[FilterModel]`, can be used to add multiple filters at the same time. |
| Id | Filter Ids, 32-bit character string representing a specific filter, to be added to the policy.  |
| FilterRole | Public enum, where 1=ApplicationTarget, 2=Inclusion, and 3=Exclusion. |

### policies/{policyId}/remove-filters

POST method to remove filters from an existing policy.

```json
POST /api/v1/policies/{policyId}/remove-filters
{
  "Filters": [
    {
      "Id": "string",
      "FilterRole": 1
    }
  ]
}
```

| Parameter | Value |
| ----- | ----- |
| Filters | An `Array[FilterModel]`, can be used to remove multiple filters at the same time. |
| Id | Filter Ids, 32-bit character string representing a specific filter, to be removed from the policy.  |
| FilterRole | Public enum, where 1=ApplicationTarget, 2=Inclusion, and 3=Exclusion. |

### policies/{policyId}/add-actions

POST method to add actions to a specific policy.

```json
POST /api/v1/policies/{policyId}/add-actions
{
  "Actions": [
    {
      "Id": "string",
      "IsChildAction": true
    }
  ]
}
```

| Parameter | Value |
| ----- | ----- |
| Actions | An `(Array[ActionModel]`, can be used to add multiple actions at the same time. |
| Id | Action Ids, 32-bit character string representing a specific action, to be added from the policy. |
| IsChildAction | Boolean that can be set to `true` or `false` to indicate if the action is considered a child or not. |

### policies/{policyId}/remove-actions

POST method to remove actions from a specific policy.

```json
POST /api/v1/policies/{policyId}/remove-actions
{
  "Actions": [
    {
      "Id": "string",
      "IsChildAction": true
    }
  ]
}
```

| Parameter | Value |
| ----- | ----- |
| Actions | An `(Array[ActionModel]`, can be used to remove multiple actions at the same time. |
| Id | Action Ids, 32-bit character string representing a specific action, to be removed from the policy. |
| IsChildAction | Boolean that can be set to `true` or `false` to indicate if the action is considered a child or not. |

### policies/{policyId}/enable/{enable}

POST method to change the status of a specific policy from inactive to active or back.

```json
GET /api/v1/policies/{policyId}/enable/{enable}
```

| Parameter | Value |
| ----- | ----- |
| policyId | A 32-bit character string representing a specific policy, for example: `44290cc3-9c86-4995-aa33-79b8ee74daf7`. This represents the __Elevate Privilege Manager Remove Programs Utility Policy​__ read-only policy template in Privilege Manager. |
| enable | Boolean that can be set to `true` or `false` to set the policy to active or inactive. By default newly created policies are inactive and need to be enabled. |
