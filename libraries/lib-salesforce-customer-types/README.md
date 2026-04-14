## Overview

The Salesforce Customer Data Types Library is a reusable RAML 1.0 library that defines Salesforce-aligned customer data types for use across System APIs within the Customer API-led Reference Architecture.

This library provides a system-aligned representation of Salesforce Account data, enabling APIs to expose consistent, consumer-friendly structures that accurately reflect the underlying system without introducing canonical abstractions.

It defines a system-aligned data model as part of a broader model where:

- System-aligned data models are defined in system-specific libraries such as this one.
- Canonical data models are defined in the Customer Canonical Data Types Library.
- Transformation between system-aligned and canonical models is handled by Process APIs.

## Role in the Architecture

This library supports the System API layer in an API-led connectivity architecture.

- System APIs use this library to expose Salesforce-aligned customer data.
- Process APIs transform this data into the canonical model.
- Experience APIs typically consume canonical data and should not rely on this library directly.

This separation ensures that system-specific data representations remain isolated from canonical models.

## Contents

This folder contains the design-time artifacts used to define and publish the Salesforce Customer Data Types Library to Anypoint Exchange.

- `raml/lib-salesforce-customer-types.raml` -- RAML 1.0 library defining Salesforce-aligned customer data types.
- `exchange-docs/` -- Anypoint Exchange documentation pages.
  - `1-Home.md` -- Introduces the library and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Provides guidance for using the library in API specifications.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.

## Key Responsibilities

The Salesforce Customer Data Types Library is responsible for:

- Defining Salesforce-aligned customer data structures.
- Standardizing how Salesforce Account data is represented across System APIs.
- Providing reusable data types for request and response payloads.
- Hiding underlying system complexity while preserving meaning and structure.
- Preventing leakage of canonical data models into the System API layer.

## Core Types

The library defines the following core data types:

- `SalesforceCustomer` -- Represents a Salesforce Account using a system-aligned, consumer-friendly structure.
- `SalesforceCustomerCollection` -- Collection of Salesforce customer records.
- `SalesforceCustomerGetData` -- Payload returned when retrieving multiple customer records.
- `SalesforceCustomerSingleGetData` -- Payload returned when retrieving a single customer record.
- `SalesforceCustomerUpsertData` -- Payload returned for create or update operations.

## Dependencies

This library does not depend on other APIs.

It is typically used with:

- Common Response Types Library -- provides a shared response model that may be used when returning system-aligned data.
- API Response Traits Library -- defines standardized response behavior.
- API Security Traits Library -- defines access control requirements.

## Usage

This library is intended to be imported and used by Salesforce System APIs.

Typical usage includes:

- Defining request and response payloads aligned with Salesforce Account data.
- Exposing system-specific identifiers and attributes in a consistent format.
- Supporting CRUD and integration operations within the System API layer.

Process APIs should transform these data types into the canonical model.

Experience APIs should not use this library directly unless there is a deliberate requirement to expose system-aligned data.

## Relationship to Other Assets

This library focuses on system-aligned data modeling for Salesforce and is intended for use in the System API layer. It is part of the Customer API-led Reference Architecture and complements other reusable assets:

- System APIs -- may use this library to expose Salesforce-aligned customer data.
- Process APIs -- may transform this system-aligned data into the canonical model.
- Common Response Types Library -- may be used to structure responses that include system-aligned data.

## Versioning

This library follows semantic versioning.

Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
