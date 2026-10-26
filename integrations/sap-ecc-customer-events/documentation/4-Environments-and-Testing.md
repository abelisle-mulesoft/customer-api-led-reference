## Overview
The SAP ECC Customer Events integration processes changes to customer master data originating from SAP ECC via DEBMAS07 IDocs. The integration transforms the incoming data into the canonical customer model and delivers the resulting customer data to the Customer Process API. The integration supports SAP-triggered event processing and HTTP-based testing by utilizing a shared processing flow to ensure consistent behavior.

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

- SAP-triggered testing: SAP ECC sends a DEBMAS07 IDoc that the implementation’s SAP IDoc listener receives and processes.
- HTTP-based testing: A representative DEBMAS07 IDoc payload is submitted through the HTTP test listener, enabling integration testing without an active SAP ECC connection.

The HTTP test listener is intended exclusively for development and testing and is not designed to serve as a production integration interface.

## Configuration and Deployment

The integration requires connectivity to SAP ECC and the Customer Process API. Instructions for configuring the MuleSoft SAP Connector, managing dependencies, setting environment-specific properties, and deploying the Mule application are maintained in the project’s GitHub documentation. Configuration and administration of the SAP ECC system itself are outside the scope of this reference architecture.
