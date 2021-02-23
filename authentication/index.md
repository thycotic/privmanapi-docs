[title]: # (API Authentication)
[tags]: # (api)
[priority]: # (1)
# API Authentication

To call the API first user need to get a token from `.../Tms/services/api/logon/token`.

Refer to these scripts for examples:

* [Authentication with invoke REST method](../scripts/00a-auth-invoke-method.ps1)
* [Authentication with invoke web request](../scripts/00b-auth-invoke-web-request.ps1)
* [Get Token with invoke REST method](../scripts/01a-get-token-invoke-method.ps1)
* [Get Token with invoke web request](../scripts/01b-get-token-invoke-web-request.ps1)

## POST

You will need to post a request message with the following details:

```json
POST /api/logon/token
{
  "Password": "string",
  "UserName": "string"
}
```

| Parameter | Value |
| ----- | ----- |
| Password | clientsecret |
| UserName | clientid |

The auth token will be returned to you.

1. Copy the token.
1. Click __Authorize__.
1. In the __Available authorizations__ modal, paste that token into the __Value__ field.
1. On the modal click __Authorize__.

You may also add the returned token to your Authorization header as a bearer token.

Refer to ["How to Manually Add API Client Users" and "Add Roles to a User"](https://docs.thycotic.com/privman/11.0.0/admin/users#how_to_manually_add_api_client_users) to setup your API Client User and to add that user to the Privilege Manager Administrators role.

## DELETE

For an API Client User to logout, a DELETE request for the api/logon/token needs to be issued with the bearer token in the Authorization header.

```curl
curl -X DELETE --header "Authorization: Bearer {token}" "https://yourinstancename/tms/services/api/logon/token"
```

with a request URL of:

`https://yourinstancename/TMS/services/api/logon/token`
