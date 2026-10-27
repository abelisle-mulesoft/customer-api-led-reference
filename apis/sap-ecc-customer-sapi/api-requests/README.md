# SAP ECC Customer System API — API Requests

This folder contains a reusable request collection for testing the SAP ECC Customer System API. The collection is designed to be used with [Bruno](https://www.usebruno.com/) and uses the [OpenCollection](https://www.opencollection.com/) format. The request artifacts are stored as text files alongside the application source, allowing them to be versioned together with this API.

## Prerequisites

- The SAP ECC Customer System API must be running and accessible in the target environment.
- Bruno must be installed.
- The appropriate Bruno environment must be selected and configured with the API’s base URL.

## Using the Collection

1. Open the [workspace](/bruno-workspace) in Bruno and select the SAP ECC Customer System API collection. Alternatively, open the `apis/sap-ecc-customer-sapi/api-requests` directory in Bruno.
2. Select the appropriate environment (for example, `local`).
3. Execute the requests individually as needed.

## Environments

### Local

The `local` environment is committed to the repository and targets a locally running instance of the SAP ECC Customer System API:

```text
http://localhost:8081
```

Select `local` in Bruno when running the API from the local development environment.

### `baseUrl`

All requests use the `baseUrl` environment variable to identify the target SAP ECC Customer System API endpoint. Changing the selected environment changes `baseUrl` without requiring modifications to individual requests.

## Test Requests

| **Request**      | **Description**                                                    |
| -----------------| ------------------------------------------------------------------ |
| Get Customers    | Retrieves customer records from SAP ECC through the GET operation. |
| Create Customers | Submits a customer creation request through the POST operation.    |

> [!NOTE]
> The GET operation retrieves customer records from SAP ECC using `BAPI_CUSTOMER_GETLIST`. The POST operation currently returns a mocked response and does not create or update customer records in SAP ECC.

