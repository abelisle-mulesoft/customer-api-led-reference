## Overview
The Oracle EBS Customer System API is deployed across multiple environments supporting development, testing, and production use cases.

## Environment Details

The API is available in the following environments:

| Name | Purpose | Instance URL |
| ------ | ------ | ------ |
| Development Environment | Development and initial testing | https://dev-customer-sapi.example.com |
| SIT Environment | Integration testing | https://test-customer-sapi.example.com |
| Staging Environment | Preprod validation testing | https://staging-customer-sapi.example.com |
| Production Environment | Production workloads | https://prod-customer-sapi.example.com |

## Prerequisites

You must register a client application and request access to one of the API's instances.

## Testing Your Application

You can use the API mocking service to simulate the behavior of the Oracle EBS Customer System API and test client integrations without requiring access to a deployed instance. At this time, no predefined scenarios or example data are configured.

## Error Handling

- 200 OK: Success
- 4xx: Client errors (validation, authentication, or request issues)
- 5xx: Server errors

Error responses follow the standardized response envelope and error handling behavior defined by the API Response Traits Library, ensuring consistency across all APIs in the architecture.
