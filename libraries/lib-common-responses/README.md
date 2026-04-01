## Overview

The Common Response Types Library is a reusable RAML 1.0 library that defines a standard response envelope for all APIs in the Customer API-led Reference Architecture.

This library establishes a consistent structure for communicating request outcomes, messages, and operation-specific payloads. It enables APIs across all layers (System, Process, and Experience) to return predictable and uniform responses as part of a broader model where:

- Response structure is defined in this library.
- Response behavior is defined in the API Response Traits Library.
- Access control is defined in the API Security Traits Library.

All APIs should return responses using the ApiResponse envelope defined in this library.

## Role in the Architecture

This library defines how API responses are structured across the API-led connectivity model.

- System APIs use the response envelope to standardize backend-facing responses.
- Process APIs use the envelope to communicate orchestration outcomes, warnings, and multi-system conditions.
- Experience APIs use the envelope to provide consistent responses to client applications.

## Contents

This folder contains the design-time artifacts used to define and publish the Common Response Types Library to Anypoint Exchange.

- `raml/lib-common-responses.raml` -- RAML 1.0 library defining the standard response envelope and related types.
- `exchange-docs/` -- Anypoint Exchange documentation pages.
  - `1-Home.md` -- Introduces the library and its role in the architecture (overrides the default `home` page).
  - `2-How-to-Consume.md` -- Provides guidance for using the library in API specifications.
  - `5-Getting-Help.md` -- Describes how to get support and additional information.

## Key Responsibilities

The Common Response Types Library is responsible for:

- Defining a standard response envelope used across all APIs.
- Separating HTTP status from business outcome semantics.
- Providing a consistent structure for success, warning, and error responses.
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

This library is intended to be imported and used by all APIs.

Typical usage includes:

- Defining response payloads using the `ApiResponse` envelope.
- Returning consistent success, warning, and error responses.
- Including structured detail messages for validation and business conditions.
- Embedding operation-specific payloads within the `data` property.

## Relationship to Other Assets

This library is part of the Customer API-led Reference Architecture and works in conjunction with:

- API Response Traits Library -- standardized response definitions at the method level.
- API Security Traits Library -- reusable security traits and related responses.
- Customer Canonical Data Types Library -- defines canonical payloads used within the response `data` property.
- System and Process APIs -- use this library to ensure consistent response structures.

## Versioning

This library follows semantic versioning.

Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.

## Intended Audience

This asset is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.
