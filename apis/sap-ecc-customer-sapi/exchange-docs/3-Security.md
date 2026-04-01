## Overview

The SAP ECC Customer System API is secured by a [Client ID Enforcement Policy](https://docs.mulesoft.com/gateway/latest/policies-included-client-id-enforcement) that restricts access to authorized client applications. To invoke the API, each request must include the following headers:

| Key           | Value                                                        |
| ------------- | ------------------------------------------------------------ |
| client_id     | The client ID associated to your registered client application |
| client_secret | The client secret associated to your registered client application |


## Authentication Requirements and Security Details

- Access is restricted to authorized client applications through the Client ID Enforcement policy.
- Each request must include valid `client_id` and `client_secret` headers issued for an approved client application..

## Access Control

Consumers must request and receive approval before accessing the API.

## Transport Security

All communication occurs over HTTPS to ensure encryption in transit.

## Data Protection

Customer data must be handled in accordance with organizational data protection policies.

## Best Practices

- Always include valid `client_id` and `client_secret` values in the request headers.
- Avoid exposing sensitive data in logs.
- Rotate credentials regularly.
