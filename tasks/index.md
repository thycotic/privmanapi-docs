[title]: # (Tasks)
[tags]: # (api)
[priority]: # (2)
# Tasks

Use this API to run a generic task.

## POST

### tasks/{taskId}

POST method sending a task Id, instance name, and input parameter values.

```json
POST /api/v1/reports/{reportId}
{
  "taskId": "string",
  "instanceName": "string",
  "inputParameterValues": "array"
}
```

| Parameter | Value |
| ----- | ----- |
| taskId | The item Id under which to create the generic task in Privilege Manager. |
| instanceName | `WHAT IS THIS exactly?` |
| inputParameterValues | `WHAT IS THIS exactly? What are the bare minimum input para values?` |

+++++QUESTIONS+++++
1. What is the instanceName, where does the user find it?
2. What are the inputParameterValues, where does the user find those? 
3. Is this for server tasks, client tasks, all kinds of tasks? 
