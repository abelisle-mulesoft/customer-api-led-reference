## Overview

The SAP ECC Customer Events integration is part of the Customer API-led Reference Architecture and implements an event-driven integration pattern within the Customer domain. The integration listens for SAP ECC customer master data changes communicated through `DEBMAS07` IDocs. Upon receiving an IDoc, it transforms the SAP-specific customer data into the enterprise canonical customer model and delivers the resulting payload to the Customer Process API.

## Role in the Architecture

This integration complements the API-led connectivity architecture by enabling event-driven synchronization of customer data originating in SAP ECC. Unlike the SAP ECC Customer System API, which provides synchronous access to SAP ECC customer data, this integration processes customer master data changes asynchronously as they occur. It bridges SAP-specific integration mechanisms with the canonical data model and the downstream Customer Process API.

## System Context

SAP ECC communicates customer master data changes through IDocs (Intermediate Documents). The integration uses the MuleSoft SAP Connector to receive `DEBMAS07` IDocs and process the customer information they contain. The incoming SAP-specific structures are transformed into the canonical customer model defined by the Canonical Customer Types Library before being delivered to the Customer Process API. This approach isolates downstream integrations from SAP-specific document structures and enables consistent customer data representation across the reference architecture.

## Contents

This folder contains the assets that document and implement the SAP ECC Customer Events integration. Its structure follows the conventions established by the Customer API-led Reference Architecture to ensure consistency, reusability, and maintainability.

- `implementation/sap-ecc-customer-events/` -- Mule application implementation containing event listeners, processing flows, configurations, and supporting resources.
- `documentation/` -- Documentation pages published to Anypoint Exchange.
- `README.md` -- This document, providing an overview of the integration and its role within the reference architecture.

## Implementation Notes

The Mule application separates event reception from processing through three Mule flows:

- **SAP IDoc Listener** -- Receives `DEBMAS07` IDocs through the MuleSoft SAP Connector.
- **HTTP Test Listener** -- Provides an alternative entry point for submitting representative IDocs during local development, testing, and demonstrations.
- **Common Processing** -- Transforms incoming IDocs into the canonical customer model and delivers the resulting payload to the Customer Process API.

Both listeners invoke the same processing logic, ensuring consistent behavior regardless of how an IDoc is received. The HTTP test listener is intended for local use and is excluded from the application artifact deployed to CloudHub.

## Key Responsibilities

The SAP ECC Customer Events integration is responsible for:

- Receiving customer master data changes through SAP ECC `DEBMAS07` IDocs.
- Transforming SAP-specific customer data into the enterprise canonical customer model.
- Delivering canonical customer data to the Customer Process API.
- Providing consistent logging and error handling throughout event processing.
- Supporting local testing and demonstrations using representative IDoc payloads without requiring an active SAP ECC connection.

## Related Assets

The SAP ECC Customer Events integration is part of the Customer API-led Reference Architecture and works in conjunction with the following assets:

- **Canonical Customer Types Library** (`lib-canonical-customer-types`) – Defines the enterprise canonical customer data model used for transformation and downstream integration.
- **Customer Process API** (`customer-papi`) – Receives canonical customer data and coordinates downstream customer synchronization.

## Usage

The integration processes customer master data changes originating in SAP ECC. Typical use cases include:

- Synchronizing customer master data changes from SAP ECC to downstream systems.
- Transforming SAP-specific customer information into a consistent enterprise representation.
- Testing event-processing scenarios using representative `DEBMAS07` IDocs.
- Demonstrating customer synchronization without depending on the availability of SAP ECC.

The HTTP testing interface is intended for local development and demonstrations and is not exposed in CloudHub deployments.

## Versioning

This integration follows semantic versioning. Version 1.0.0 represents the initial release of the SAP ECC Customer Events integration within the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- Integration architects.
- MuleSoft developers.
- Platform engineers implementing event-driven integration patterns.
- Solution engineers demonstrating SAP ECC integration and customer synchronization.
