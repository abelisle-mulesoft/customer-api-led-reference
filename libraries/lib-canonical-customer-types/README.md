## Overview

The Customer Canonical Data Types Library is a reusable RAML 1.0 library within the Customer API-led Reference Architecture. It defines canonical customer data types for use across Process APIs, providing a system-agnostic representation that abstracts source systems such as Salesforce, SAP ECC, and Oracle EBS. This enables Process APIs to deliver a consistent, business-aligned customer model regardless of the originating system.

## Role in the Architecture

This library supports the Process API layer in an API-led connectivity architecture.

- System APIs expose system-aligned data models specific to each source system.
- Process APIs transform and normalize that data into a canonical model.
- This library defines the canonical data model used by Process APIs.

This separation ensures that system-specific complexity is isolated while providing a unified data representation for downstream consumers.

## Contents

This folder contains the assets that define and document the Customer Canonical Data Types Library. Its structure reflects the opinionated conventions established by the Customer API-led Reference Architecture to ensure consistency, reusability, and maintainability.

- `raml/lib-canonical-customer-types.raml` -- RAML 1.0 library defining canonical customer data types.
- `exchange-docs/` -- Documentation pages published to Anypoint Exchange.
  - `1-Home.md` -- Introduces the library and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Provides guidance for using the library in API specifications.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.

## Key Responsibilities

The Customer Canonical Data Types Library is responsible for:

- Defining a canonical, system-agnostic customer data model.
- Standardizing how customer data is represented across Process APIs.
- Enabling consistent transformation from system-aligned models.
- Reducing duplication and divergence of data definitions across APIs.
- Supporting reuse through a centralized RAML library.

## Core Data Types

The library defines the following core data types:

- `Customer` -- Canonical representation of a customer using a normalized, business-aligned structure.
- `CustomerCollection` -- Collection of canonical customer records.
- `CustomerGetData` -- Payload returned when retrieving multiple customer records.
- `CustomerSingleGetData` -- Payload returned when retrieving a single customer record.

## Related Assets

The Customer Canonical Data Types Library is part of the Customer API-led Reference Architecture and works in conjunction with the following assets.

### RAML Libraries

- Common Response Types Library -- Defines the standard response envelope used across APIs.

### APIs

- Customer Process API -- Uses this library to expose a canonical customer representation to upstream consumers.

## Usage

This library is intended to be imported and used by Process APIs. Typical usage includes:

- Defining request and response payloads using canonical customer types.
- Transforming system-aligned data from System APIs into the canonical model.
- Ensuring consistent data structures across multiple Process APIs.

System APIs should not use this library, as they must remain aligned to their underlying systems.

## Versioning

This library follows semantic versioning. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
