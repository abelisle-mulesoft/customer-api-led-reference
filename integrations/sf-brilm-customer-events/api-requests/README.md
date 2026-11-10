# Salesforce Brilliant Mule Customer Events — API Requests

This folder contains a reusable request collection for testing the Salesforce Brilliant Mule Customer Events integration locally through its HTTP test listener. The collection is designed to be used with [Bruno](https://www.usebruno.com/) and uses the [OpenCollection](https://www.opencollection.com/) format. The request artifacts are stored as text files alongside the application source, allowing them to be versioned together with the integration.

## Prerequisites

- The Salesforce Brilliant Mule Customer Events integration must be running locally in Anypoint Studio.
- The HTTP test listener must be enabled and accessible at `http://localhost:8081/test/account-event`.
- Bruno must be installed.

> [!NOTE]
> The HTTP test listener is intended exclusively for local development and testing. It is not a public API endpoint.

## Using the Collection

1. Open the [workspace](/bruno-workspace) in Bruno and select the Salesforce Brilliant Mule Customer Events collection. Alternatively, open the `integrations/sf-brilm-customer-events/api-requests` directory in Bruno.
2. Execute the requests individually as needed.

The requests submit representative Salesforce Account Change Data Capture (CDC) events through the HTTP test listener, exercising the same processing flow used by the Salesforce CDC listener.

## Test Requests

| **Request**                    | **Description**                                                                                                     |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| Create Account Event           | Submits a Salesforce Account CREATE event to verify customer retrieval and synchronization event processing.        |
| Update Account Event           | Submits a Salesforce Account UPDATE event to verify customer retrieval and synchronization event processing.        |
| Integration User Event         | Verifies that events originating from the configured integration user are ignored to prevent synchronization loops. |
| Delete Account Event           | Verifies that Salesforce Account DELETE events are intentionally ignored.                                           |
| Undelete Account Event         | Verifies that Salesforce Account UNDELETE events are intentionally ignored.                                         |
| Reject Unsupported HTTP Method | Verifies that the HTTP listener rejects unsupported HTTP methods.                                                   |

> [!NOTE]
> Events that are intentionally ignored return the same successful HTTP response as processed events. Use the application TRACE logs to verify that the expected processing path was executed.
