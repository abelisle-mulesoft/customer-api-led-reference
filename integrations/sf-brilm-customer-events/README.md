## Overview

The Salesforce Brilliant Mule Customer Events integration is part of the Customer API-led Reference Architecture and implements an event-driven integration pattern within the Customer domain. The integration subscribes to Salesforce Change Data Capture (CDC) events generated when account records are created, updated, deleted, or undeleted in the Brilliant Mule instance. Upon receiving a CDC event, it retrieves the account data, transforms the Salesforce-specific customer data into the enterprise canonical customer model, and delivers the resulting payload to the Customer Process API.

## Role in the Architecture

This integration complements the API-led connectivity architecture by enabling event-driven synchronization of customer data originating in Salesforce Brilliant Mule. Unlike the Salesforce Brilliant Mule Customer System API, which provides synchronous access to Salesforce Brilliant Mule customer data, this integration processes account data changes asynchronously as they occur. It bridges Salesforce-specific integration mechanisms with the canonical data model and the downstream Customer Process API.

## System Context

Salesforce Brilliant Mule publishes Change Data Capture (CDC) events that describe account record changes, including creations, updates, deletions, and undeletions. The integration uses the MuleSoft Salesforce Connector to subscribe to the relevant streaming channel and process the published CDC events. The integration transforms incoming Salesforce-specific structures into the canonical customer model defined by the Canonical Customer Types Library before delivering them to the Customer Process API. This approach isolates downstream integrations from Salesforce-specific data structures and enables consistent customer data representation across the reference architecture.

## Contents

This folder contains the assets that document and implement the Salesforce Brilliant Mule Customer Events integration. Its structure follows the conventions established by the Customer API-led Reference Architecture to ensure consistency, reusability, and maintainability.

- `implementation/sf-brilm-customer-events/` -- Mule application implementation containing event listeners, processing flows, configurations, and supporting resources.
- `documentation/` -- Documentation pages published to Anypoint Exchange.
- `api-requests/` -- Bruno collection for testing the Salesforce Brilliant Mule Customer Events integration through its local HTTP test listener.
- `README.md` -- This document, providing an overview of the integration and its role within the reference architecture.

## Implementation Notes

The Mule application separates event reception from processing using three Mule flows:

- **Salesforce Replay Channel Listener** -- Receives CDC events through the MuleSoft Salesforce Connector.
- **HTTP Test Listener** -- Provides an alternative entry point for submitting representative CDC events during local development, testing, and demonstrations.
- **Common Processing** -- Processes incoming CDC events, retrieves the corresponding Salesforce account data, transforms it into the canonical customer model, and delivers the resulting payload to the Customer Process API.

Both listeners invoke the same processing logic, ensuring consistent behavior regardless of how a CDC event is received. The HTTP test listener is intended for local use and is excluded from the application artifact deployed to CloudHub.

## Key Responsibilities

The Salesforce Brilliant Mule Customer Events integration is responsible for:

- Receiving Salesforce Brilliant Mule account change events through Change Data Capture (CDC).
- Transforming Salesforce-specific account data into the enterprise canonical customer model.
- Delivering canonical customer data to the Customer Process API.
- Providing consistent logging and error handling throughout event processing.
- Supporting local testing and demonstrations using representative event payloads without requiring an active Salesforce Brilliant Mule connection.

## Related Assets

The Salesforce Brilliant Mule Customer Events integration is part of the Customer API-led Reference Architecture and works in conjunction with the following assets:

- **Canonical Customer Types Library** (`lib-canonical-customer-types`) – Defines the enterprise canonical customer data model used for transformation and downstream integration.
- **Customer Process API** (`customer-papi`) – Receives canonical customer data and coordinates downstream customer synchronization.

## Usage

The integration processes account data changes originating in Salesforce Brilliant Mule. Typical use cases include:

- Synchronizing account data changes from Salesforce Brilliant Mule to downstream systems.
- Transforming Salesforce-specific customer information into a consistent enterprise representation.
- Testing event-processing scenarios using representative CDC events.
- Demonstrating customer event processing without requiring an active Salesforce Brilliant Mule connection.

The HTTP testing interface is intended for local development and demonstrations and is not exposed in CloudHub deployments.

## Versioning

This integration follows semantic versioning. Version 1.0.0 represents the initial release of the Salesforce Brilliant Mule Customer Events integration within the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- Integration architects.
- MuleSoft developers.
- Platform engineers implementing event-driven integration patterns.
- Solution engineers demonstrating Salesforce Brilliant Mule integration and customer synchronization.
