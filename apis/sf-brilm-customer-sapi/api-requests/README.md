# Salesforce Brilliant Mule Customer SAPI — API Requests

This folder contains a reusable request collection for testing the Salesforce Brilliant Mule Customer System API. The collection is designed to be used with [Bruno](https://www.usebruno.com/) and uses the [OpenCollection](https://www.opencollection.com/) format. The request artifacts are stored as text files alongside the application source, allowing them to be versioned together with this API.

## Prerequisites

- The Salesforce Brilliant Mule Customer System API must be running and accessible in the target environment.
- Bruno must be installed.
- The appropriate Bruno environment must be selected and configured with the API’s base URL.

## Using the Collection

1. Open the [workspace](/bruno-workspace) in Bruno and select the Salesforce Brilliant Mule Customer System API collection. Alternatively, open the `apis/sf-brilm-customer-sapi/api-requests` directory in Bruno.
2. Select the appropriate environment (for example, `local`).
3. Execute the requests individually as needed.

## Environments

### Local

The `local` environment is committed to the repository and targets a locally running instance of the Salesforce Brilliant Mule Customer System API:

```text
http://localhost:8081
```

Select `local` in Bruno when running the API from the local development environment.

### Environment Variables

The collection uses the following environment variables:

| Variable | Description |
| -------- | ----------- |
| `baseUrl` | Base URL of the Salesforce Brilliant Mule Customer System API. |
| `salesforceAccountId` | Salesforce Account ID used by the Get Customer by ID request. |

## Test Requests

| **Request**        | **Description**                                              |
| ------------------ | ------------------------------------------------------------ |
| Get Customers      | Retrieves customer records from Salesforce Brilliant Mule through the GET operation. |
| Get Customer by ID | Retrieves a customer record by account ID from Salesforce Brilliant Mule through the GET operation. |
| Create Customers   | Creates or updates customer records in Salesforce Brilliant Mule through the POST operation. |

