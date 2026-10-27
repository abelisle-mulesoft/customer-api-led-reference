# SAP ECC Customer Events — API Requests

This folder contains a reusable request collection for testing the SAP ECC Customer Events integration locally through its HTTP test listener. The collection is designed to be used with [Bruno](https://www.usebruno.com/) and uses the [OpenCollection](https://www.opencollection.com/) format. The request artifacts are stored as text files alongside the application source, allowing them to be versioned together with the integration.

## Prerequisites

- The SAP ECC Customer Events integration must be running locally in Anypoint Studio.
- The HTTP test listener must be enabled and accessible at `http://localhost:8081/test/customer-idoc`.
- Bruno must be installed.

> [!NOTE]
> The HTTP test listener is intended exclusively for local development and testing. It is not a public API endpoint.

## Using the Collection

1. Open the [workspace](/bruno-workspace) in Bruno and select the SAP ECC Customer Events collection. Alternatively, open the `integrations/sap-ecc-customer-events/api-requests` directory in Bruno.
2. Execute the requests individually as needed.

## Test Requests

| **Request**                    | **Description**                                                   |
| ------------------------------ | ----------------------------------------------------------------- |
| Process Valid Customer IDoc    | Submits a valid SAP DEBMAS07 IDoc for processing.                 |
| Process Invalid Customer IDoc  | Submits an invalid IDoc to verify error handling.                 |
| Reject Unsupported HTTP Method | Verifies that the HTTP listener rejects unsupported HTTP methods. |

