## Overview

This repository offers a Customer API-led Reference Architecture, initially developed and presented to a customer in October 2024 to demonstrate MuleSoft’s API-led connectivity and incorporate Salesforce Change Data Capture (CDC) based on specific requirements. In March 2026, the demo was revisited, refined through multiple iterations, and expanded in scope, ultimately resulting in this formalized Reference Architecture.

The Customer API-led Reference Architecture demonstrates API design, structure, and standardization using an API-led connectivity approach. It currently highlights three complementary concepts:

- Event-driven integration using Salesforce Change Data Capture (CDC) in Mule.
- A comprehensive API-led connectivity implementation for customer data across systems.
- Automation commands that can be used to implement CI/CD pipelines.

The Customer API-led Reference Architecture is composed of the following reusable assets:

- System APIs that align with the underlying systems.
- A Process API that orchestrates and transforms data using a canonical model.
- Reusable RAML fragments that standardize data models, response structures, behavior, and security.
- Utility scripts that support development, synchronization, publication, and maintenance workflows.

This repository serves as both a working implementation and a set of platform standards for reuse across projects. It provides an opinionated approach to API-led connectivity, informed by practical customer experience and established enterprise integration patterns. The conventions, structures, and standards here are designed to promote consistency, reuse, and maintainability across API portfolios.

> [!NOTE]
> The historical context, goals, and scope of the initial baseline are documented in [`docs/releases/release-1-baseline.md`](docs/releases/release-1-baseline.md).

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
- **Reuse through fragments** -- Common patterns are centralized and reused across APIs.

## Source of Truth

This repository is the authoritative source of truth for all assets that comprise the Customer API-led Reference Architecture, including:

- API specifications and RAML fragments
- Mule application implementations
- Documentation describing the architecture, standards, and supporting workflows
- Anypoint Exchange metadata and dependency definitions

Assets published to Anypoint Platform, including Design Center projects and Anypoint Exchange assets, are considered generated artifacts derived from this repository and are maintained solely to support demonstrations, experimentation, and validation activities.

As a result:

- Changes are always made in Git first.
- Design Center projects are synchronized from this repository through automation.
- Anypoint Exchange publications are produced from the synchronized Design Center assets.
- Drift between Git and Anypoint Platform assets is periodically detected and corrected in favor of the repository state.

This repository therefore follows a Git-centric workflow where source control, rather than the Anypoint Platform, is the authoritative system of record.

## Repository Structure

- `apis/` -- API assets that comprise the reference architecture.
- `assets/` -- Images used throughout repository documentation.
- `docs/` -- Additional repository documentation, release notes, and technical guidance.
- `libraries/` -- Shared RAML fragments used throughout the reference architecture.
- `scripts/` -- Utility scripts supporting development and synchronization workflows.
- `standards/` -- Standards, principles, and implementation guidance.

Refer to the README file within each folder for additional details.

## Architecture Summary

1. System APIs expose system-specific data using system-aligned models.
2. Process APIs orchestrate across systems and transform data into a canonical model.
3. Shared fragments enforce consistency across:
   - Data models
   - Response structure
   - Response behavior
   - Security
4. Utility scripts support development, synchronization, publication, and maintenance workflows.

Together, these components provide:

- A consistent API design standard.
- A reusable set of building blocks.
- A repeatable approach to API development and publication.

## Implementation Scope

This repository demonstrates API-led architecture patterns, reusable RAML fragments, and Mule implementations for the APIs included in the reference architecture.

Standardized implementations for logging, monitoring, and enterprise error handling are not included. MuleSoft Professional Services typically provides reusable patterns for these capabilities in customer engagements. These assets are intentionally excluded from this reference architecture.

## Intended Audience

This repository is intended for:

- API designers.
- Integration architects.
- MuleSoft developers.
- Platform engineers defining enterprise API standards.

## Versioning

Semantic versioning is applied at the asset level within this repository. Version 1.0.0 represents the initial standardized release of the Customer API-led Reference Architecture.
