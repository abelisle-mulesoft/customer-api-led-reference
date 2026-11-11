## Overview

The Salesforce Brilliant Mule Customer Events integration processes changes to account data originating from the Salesforce Brilliant Mule instance via Change Data Capture (CDC) events. It processes account creation and update events, retrieves canonical customer data through the Salesforce Brilliant Mule Customer System API, and prepares synchronization events for downstream processing by the Customer Process API. The integration supports CDC-triggered processing and HTTP-based testing through a shared processing flow to ensure consistent behavior.

## Environment Details

The following environments illustrate a typical deployment configuration:

| Name | Purpose |
| ------ | ------ |
| Development Environment | Development and initial testing |
| SIT Environment | Integration testing |
| Staging Environment | Preprod validation testing |
| Production Environment | Production workloads |

## Testing

The integration accommodates two distinct testing approaches:

- **CDC-triggered testing:** Salesforce Brilliant Mule publishes a Change Data Capture (CDC) event that the integration's Salesforce Replay Channel listener receives and processes.
- **HTTP-based testing:** A representative Salesforce CDC event payload is submitted through the HTTP test listener, exercising the same processing flow without requiring Salesforce to publish an actual CDC event. Processing supported events still requires connectivity to the Salesforce Brilliant Mule Customer System API.

The HTTP test listener is intended exclusively for development and testing and is not designed to serve as a production integration interface.

## Configuration and Deployment

The integration requires connectivity to the Salesforce Brilliant Mule instance, the Salesforce Brilliant Mule Customer System API, and the Customer Process API. Instructions for configuring the MuleSoft Salesforce Connector, managing dependencies, setting environment-specific properties, and deploying the Mule application are maintained in the project's GitHub documentation. Configuration and administration of the Salesforce Brilliant Mule instance itself are outside the scope of this reference architecture.
