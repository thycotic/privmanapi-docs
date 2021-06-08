[title]: # (Tasks)
[tags]: # (api)
[priority]: # (2)
# Tasks

Use this API to run a generic task. Any task targeted to run on endpoints can be run/scheduled via this API, including the Password Randomization task.

## POST

### tasks/{taskId}

POST method sending a task Id, instance name, and input parameter values.

```json
POST /api/v1/tasks/{taskId}
{
  "taskId": "string",
  "instanceName": "string",
  "inputParameterValues": "array"
}
```

| Parameter | Value |
| ----- | ----- |
| taskId | The item Id under which to create the generic task in Privilege Manager. |
| instanceName | Instance as in task instance. The example below uses TestAPI as an instance name and if used as a scheduled task, the name would be "Scheduled run TestAPI".  |
| inputParameterValues | The input parameter values as found in the item XML under the inputParameterValues node. |

## Example

```json
Url: .../services/api/v1/tasks/38775f9e-9995-49de-8732-4994d0d2332a?instanceName=TestAPI
Body: [
       {
        "Name":"WmiClasses",
        "Value":{
        "type":"http://schemas.arellia.com/dc/:ObjectWrapper", "ValueType":"System.String[]", "Value":[ "ROOT\\CIMV2:WIN32_ComputerSystemProduct", "ROOT\\CIMV2:Win32_ComputerSystem", "ROOT\\CIMV2:Win32_OperatingSystem" ] 
        } 
       }, 
       {
        "Name":"ResourceIds", 
        "Value":{ 
        "type":"Arellia.Serialization.ObjectWrapper, Arellia.Core", "ValueType":"System.Guid[]",
        "Value":["1d406d08-ffeb-463f-b3d1-6fd790f5a358"]
        }
       }
      ]
```
