## Overview

This repository provides a Customer API-led Reference Architecture that illustrates the design, structure, and standardization of APIs using an API-led connectivity approach. This reference architecture is based on a demo that illustrates two complementary concepts:

- Event-driven integration using Salesforce Change Data Capture (CDC) in Mule.
- A comprehensive API-led connectivity implementation for customer data across systems.

The assets in this repository reflect the API design, implementation, and standardization aspects of that demo. This repository includes:

- System APIs aligned to underlying systems.
- A Process API that orchestrates and transforms data using a canonical model.
- Reusable RAML libraries that standardize data models, response structures, behavior, and security.
- Utility scripts that automate publishing assets to Anypoint Exchange.

This repository functions as both a working implementation and a set of platform standards for reuse across multiple projects. It intentionally represents an opinionated implementation of API-led connectivity based on practical customer experience and proven enterprise integration patterns. The conventions, structures, and standards presented here are intended to promote consistency, reuse, and maintainability across API portfolios.

## Architecture Diagram

The diagram below depicts the Customer API-led Reference Architecture, highlighting System APIs, the Process API, and supporting libraries.

![Customer API-led Reference Architecture](assets/customer-api-led-reference-architecture.png)

The diagram illustrates the interaction between System APIs, the Process API, and the shared libraries that enforce consistency across the architecture.

## Architecture

This implementation follows an API-led connectivity model composed of three layers:

- **System APIs** provide access to underlying systems using system-aligned models.
- **Process APIs** orchestrate data across systems and transform it into a canonical model.
- **Experience APIs** consume canonical data and tailor it for specific consumers, but they are intentionally omitted from this implementation because this reference architecture focuses on system integration and canonical data orchestration rather than consumer-specific experiences.

### Key Principles

- **System-aligned data models** -- System APIs reflect the structure and constraints of the underlying system.
- **Canonical data model** -- Defined once and used by Process APIs to enable cross-system consistency.
- **Separation of concerns** -- Each layer has a clearly defined responsibility.
- **Reuse through libraries** -- Common patterns are centralized and reused across APIs.

## Source of Truth

This repository is the authoritative source of truth for all assets that comprise the Customer API-led Reference Architecture, including:

- API specifications and RAML libraries
- Anypoint Exchange metadata (i.e., `exchange.json` file)
- Mule application implementations
- Documentation page

Assets published to Anypoint Platform, including Design Center projects and Anypoint Exchange assets, are considered generated artifacts derived from this repository and are maintained solely to support demonstrations, experimentation, and validation activities.

As a result:

- Changes are always made in Git first.
- Design Center projects are synchronized from this repository through automation.
- Anypoint Exchange publications are produced from the synchronized Design Center assets.
- Drift between Git and Anypoint Platform assets is periodically detected and corrected in favor of the repository state.

This repository therefore follows a Git-centric workflow where source control, rather than the Anypoint Platform, is the authoritative system of record.

## Repository Structure

```text
├── apis/
│   ├── customer-papi/
│   ├── oracle-ebs-customer-sapi/
│   ├── sap-ecc-customer-sapi/
│   ├── sf-brilm-customer-sapi/
│   └── sf-umbre-customer-sapi/
│
├── libraries/
│   ├── lib-canonical-customer-types/
│   ├── lib-common-responses/
│   ├── lib-response-traits/
│   └── lib-security-schemes/
│
├── assets/
├── scripts/
└── standards/
```

API projects and RAML libraries adhere to standardized folder structures to ensure consistency throughout the reference architecture.

Each API project contains the following components:

- `design/` -- Design-time RAML specifications and fragments.
- `documentation/` -- Documentation pages published to Anypoint Exchange.
- `implementation/` -- Mule application implementation artifacts.
- `README.md` -- Provides an overview and usage guidance.

Each RAML library contains the following components:

- `design/` -- RAML libraries, data types, traits, and related fragments.
- `documentation/` -- Documentation pages published to Anypoint Exchange.
- `README.md` -- Provides an overview and usage guidance.

## APIs

This repository includes the following APIs:

### Process API

- `customer-papi` -- Orchestrates customer data across systems using the canonical model.

### System APIs

- `oracle-ebs-customer-sapi` -- Provides access to Oracle EBS customer data.
- `sap-ecc-customer-sapi` -- Provides access to SAP ECC customer data.
- `sf-brilm-customer-sapi` -- Provides access to Salesforce (Brilliant Mule) customer data.
- `sf-umbre-customer-sapi` -- Provides access to Salesforce (Umbrella) customer data.

System APIs expose data aligned with the underlying systems and do not transform it into the canonical model.

## Libraries

Reusable RAML libraries are employed to standardize API design throughout the architecture.

### Data Models

- `lib-canonical-customer-types` -- Defines the canonical customer data model used by Process APIs.

### Response and Behavior

- `lib-common-responses` -- Defines the standard response envelope used across APIs.
- `lib-response-traits` -- Defines standardized HTTP response behavior.

### Security

- `lib-security-schemes` -- Defines reusable security schemes for authentication and authorization.

### Design Model

These libraries work together to provide:

- **Access control** is defined in the Security Schemes Library.
- **Response behavior** is defined in the Response Traits Library.
- **Response structure** is defined in the Common Responses Library.
- **Data models** are defined in system-specific and canonical libraries.

## Scripts

The `scripts/` directory contains utility scripts designed to support development workflows.

### upload-exchange-pages.sh

This script automates the upload of documentation pages to Anypoint Exchange for APIs and libraries.

This script:

- Standardizes how documentation pages are published.
- Ensures consistent page structure across assets.
- Reduces manual effort when updating Exchange documentation.

## How It All Fits Together

1. System APIs expose system-specific data using system-aligned models.
2. Process APIs orchestrate across systems and transform data into a canonical model.
3. Libraries enforce consistency across:
   - Data models
   - Response structure
   - Response behavior
   - Security
4. Scripts automate publishing and ensure consistency in Anypoint Exchange.

Together, these components provide:

- A consistent API design standard.
- A reusable set of building blocks.
- A repeatable approach to API development and publication.

## Implementation Scope

This repository demonstrates API-led architecture patterns, reusable RAML libraries, and Mule implementations for the APIs included in the reference architecture.

Standardized implementations for logging, monitoring, and enterprise error handling are not included. MuleSoft Professional Services typically provides reusable patterns for these capabilities in customer engagements. These assets are intentionally excluded from this reference architecture.

## Intended Audience

This repository is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.

## Versioning

Semantic versioning is applied at the asset level within this repository. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.
