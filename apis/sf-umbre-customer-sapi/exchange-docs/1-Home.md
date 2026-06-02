## Overview

The Salesforce Umbrella Customer System API provides access to customer data stored in the Salesforce Umbrella instance. This API simplifies integration with Salesforce by maintaining consistency with established customer account concepts and structures. Customer data is presented through a clear, system-aligned data model designed for consumption by upstream Process APIs within the Customer API-led reference architecture.

## Purpose

This System API abstracts the complexity involved in integrating with the Salesforce Umbrella instance and its data model, providing a reusable, system-aligned interface. By encapsulating system-specific complexity behind a stable interface, the API simplifies integration with the Salesforce Umbrella instance while maintaining fidelity to the source system.

## Capabilities

The Salesforce Umbrella Customer System API currently offers the following functionalities:

- Retrieve customer record by account ID.
- Retrieve customer records.
- Create or update customer records.

All responses conform to a system-aligned customer model and are standardized using a shared response envelope defined by the Common Response Types Library and API Response Traits Library.

## Data Model

Customer data exchanged through this API follows a system-aligned customer model derived from the Salesforce Umbrella instance customer account concepts and structures. This System API is intentionally system-aligned rather than canonical. Canonical transformation and cross-system normalization belong in the Process API layer.

## Error Handling and Status Codes

The API utilizes standard HTTP status codes to indicate success or failure:

- **200 OK:** Request succeeded; response body contains the requested data or processing summary.
- **4xx Client Errors:** Indicate issues with the request, such as invalid authentication, malformed request body, or unauthorized access.
- **5xx Server Errors:** Indicate server-side issues, such as internal errors or service unavailability.

Specific error details are returned in the response body using the standardized response envelope and error handling behavior defined by the API Response Traits Library.

## Integration Architecture

The Salesforce Umbrella Customer System API, within the System API layer, enables access to the Salesforce Umbrella instance customer data in the Customer API-led reference architecture. The Customer Process API handles orchestration and canonical transformation across systems. The diagram below shows the Salesforce Umbrella Customer System API’s role in the architecture.

![Salesforce Umbrella Customer System API in Customer API-Led Reference Architecture](resources/sf-umbre-customer-sapi-diagram-a392e58b-1e1b-4b02-9d92-7621909f5caa.png)

In this architecture, the Salesforce Umbrella Customer System API remains system-aligned, preserving the Salesforce Umbrella instance customer account structures while enabling the Process API to normalize and coordinate data across Salesforce, SAP ECC, and other systems.

## Recommended Best Practices

- Always include valid `client_id` and `client_secret` values in the request headers as required by the applied client ID enforcement policy.
- Employ HTTPS for all communications to ensure the security of data in transit.
- Validate all payloads against the system-aligned data model.
- Utilize correlation identifiers (`correlationId`) to enable end-to-end tracing of requests across all API layers.
- Log only metadata, such as correlation identifiers, timestamps, and status codes, for auditing and troubleshooting purposes rather than full payloads.
- Mask or omit sensitive, confidential, and proprietary information from all log entries.
- Ensure that all logging practices comply with organizational security and data governance policies.
