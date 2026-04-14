## Overview

The Common Response Types Library is a reusable RAML 1.0 library that defines a reference response model for APIs in the Customer API-led Reference Architecture.

This library promotes a consistent structure for communicating request outcomes, messages, and operation-specific payloads. Its strongest recommendation is the use of a structured response model for communicating errors, warnings, and diagnostic details in a predictable way across APIs.

The broader `ApiResponse` envelope defined by this library can also be used to represent successes, warnings, and errors in a uniform way across an internal API portfolio. That approach is intentional and opinionated. It is suitable for enterprise integration environments that value consistency, observability, and reusable implementation patterns, but it should be adopted deliberately rather than treated as a universal default for every API.

Within the broader reference architecture:

- Response structure is defined in this library.
- Response behavior is defined in the API Response Traits Library.
- Access control is defined in the API Security Traits Library.

Teams can use this library as a reference for establishing their own response standards, adopting either the full response envelope or selected aspects of it, such as the structured error model, correlation identifiers, and standardized detail messages.

## Role in the Architecture

This library defines a reference approach for structuring API responses across the API-led connectivity model.

- System APIs can use the response model to standardize backend-facing responses and operational diagnostics.
- Process APIs are the strongest candidates for the full envelope because they often need to communicate orchestration outcomes, warnings, and multi-system conditions.
- Experience APIs may adopt the full envelope when consistency across an internal portfolio is more important than a lightweight client-facing shape, but teams should evaluate that choice intentionally.

## Contents

This folder contains the design-time artifacts used to define and publish the Common Response Types Library to Anypoint Exchange.

- `raml/lib-common-responses.raml` -- RAML 1.0 library defining the standard response envelope and related types.
- `exchange-docs/` -- Anypoint Exchange documentation pages.
  - `1-Home.md` -- Introduces the library and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Provides guidance for using the library in API specifications.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.

## Key Responsibilities

The Common Response Types Library is responsible for:

- Defining a reference response envelope for use across internal APIs.
- Promoting a structured error model with machine-readable codes, human-readable messages, and optional diagnostic details.
- Separating HTTP status from business outcome semantics when teams choose to adopt the full envelope.
- Providing a consistent structure for success, warning, and error responses in portfolios that benefit from a uniform model.
- Enabling structured detail messages for validation, warnings, and errors.
- Supporting observability through correlation identifiers and standardized codes.

## Core Types

The library defines the following core data types:

- `ApiResponse` -- Standard response envelope containing metadata and operation-specific data.
- `ApiResponseStatus` -- Business outcome of the request (e.g., SUCCESS, WARNING, ERROR).
- `ResponseDetail` -- Structured detail message for additional conditions.
- `Severity` -- Classification of detail messages (e.g., INFO, WARNING, ERROR).

## Dependencies

This library does not depend on other APIs.

It is typically used with:

- API Response Traits Library -- applies standardized responses using this model.
- API Security Traits Library -- produces responses structured using this model.
- Code Taxonomy Guide -- standardizes response and error codes.

## Usage

This library is intended to be imported and used as a reference when defining response models.

Typical usage includes:

- Defining structured error payloads with standardized codes, messages, and optional detail entries.
- Returning consistent warning and error responses across internal APIs.
- Optionally adopting the full ApiResponse envelope for success, warning, and error responses when a uniform enterprise model is desirable.
- Embedding operation-specific payloads within the `data` property when the full envelope is used.

## Relationship to Other Assets

This library focuses on response structure and can be used on its own or alongside libraries that define response behavior and access control. It is part of the Customer API-led Reference Architecture and complements other reusable assets:

- API Response Traits Library -- defines reusable response behaviors for common HTTP scenarios.
- API Security Traits Library -- defines reusable traits for authentication and authorization.
- Customer Canonical Data Types Library -- defines canonical payloads that may be used within the response `data` property.
- System, Process, and Experience APIs -- may use this library to define consistent response structures when appropriate.

## Versioning

This library follows semantic versioning.

Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.

It is especially relevant for teams defining internal enterprise API standards and evaluating whether to adopt a full response envelope or only the structured error aspects of the model.
