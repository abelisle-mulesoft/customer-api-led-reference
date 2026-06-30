## Overview

The Salesforce Brilliant Mule Customer System API is part of the Customer API-led Reference Architecture and implements the System API layer within the Customer domain. This API provides system-aligned access to customer data stored in the Salesforce Brilliant Mule instance. It exposes resources and data structures that reflect the underlying system, without applying canonical transformations.

## Role in the Architecture

This API represents the System API layer in an API-led connectivity architecture.

- System APIs provide system-aligned access to customer data.
- Process APIs orchestrate and transform data from System APIs into canonical models.
- Experience APIs consume the canonical model exposed by a Process API to deliver channel-specific experiences.

This separation ensures loose coupling, reusability, and consistent data representation across systems.

## System Context

This API provides access to customer data stored in the Salesforce Brilliant Mule instance using system-specific structures, identifiers, and constraints. It reflects the capabilities and limitations of the underlying system, including Salesforce data models (such as Account and related objects) and integration patterns, and does not abstract or normalize data into a canonical model.

## Contents

This folder contains the assets that define, document, and implement the Salesforce Brilliant Mule Customer System API.  Its structure reflects the opinionated conventions established by the Customer API-led Reference Architecture to ensure consistency, reusability, and maintainability.

- `raml/sf-brilm-customer-sapi.raml` -- RAML specification defining the API contract.
- `implementation/sf-brilm-customer-sapi/` -- Mule application implementation containing flows, configurations, and supporting resources.
- `exchange-docs/` -- Documentation pages published to Anypoint Exchange.
  - `1-Home.md` -- Introduces the API and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Describes how to request access and successfully invoke the API.
  - `3-Security.md` -- Describes security requirements and policies applied to the API.
  - `4-Environments-and-Testing.md` -- Lists available environments, endpoints, and prerequisites for testing the API.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.
- `README.md` -- This document, providing an overview of the API and its role within the reference architecture.

## Implementation Notes

In addition to synchronous request-response interactions, the current implementation also supports event-driven integration using Salesforce Change Data Capture (CDC). This event-driven behavior remains system-aligned and is therefore treated as part of the underlying system interaction model rather than as a canonical or separately modeled API contract. Future revisions of this reference architecture may evolve this capability into a dedicated Async API.

## Key Responsibilities

The Salesforce Brilliant Mule Customer System API is responsible for:

- Providing system-aligned access to Salesforce customer account data in the Brilliant Mule instance.
- Exposing Salesforce customer account structures, identifiers, and constraints without transforming them into the enterprise canonical customer model.
- Encapsulating Salesforce-specific integration details behind a stable API contract.
- Supporting event-driven interaction patterns through Salesforce Change Data Capture (CDC).
- Enforcing standard API security and response behavior.
- Returning consistent responses using the standard response envelope.

## Capabilities

This API supports the following capabilities:

- Retrieve individual customer accounts from the Salesforce Brilliant Mule instance.
- Retrieve collections of customer accounts from the Salesforce Brilliant Mule instance.
- Create or update customer accounts in the Salesforce Brilliant Mule instance.
- Return customer data using Salesforce-aligned field names and the standard response envelope.
- Consume customer change events using Salesforce Change Data Capture (CDC).

## Related Assets

The Salesforce Brilliant Mule Customer System API is part of the Customer API-led Reference Architecture and works in conjunction with the following assets.

### RAML Libraries

- API Response Traits Library -- Defines standardized response behaviors and HTTP status handling.
- API Security Schemes Library -- Defines reusable security schemes such as client ID enforcement.
- Common Response Types Library -- Defines the standard response envelope used across APIs.

### Standards

- Code Taxonomy Guide -- Defines standardized response and error codes used across the architecture.

## Usage

Process APIs and other consumers use this API to interact with customer data stored in the Salesforce Brilliant Mule instance. Typical use cases include:

- Retrieve customer account information from Salesforce.
- Create or update customer accounts in Salesforce.
- Access Salesforce-specific customer attributes and identifiers.
- Consume customer change events through Salesforce Change Data Capture (CDC).

## Versioning

This API follows semantic versioning. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers implementing API-led connectivity patterns.
