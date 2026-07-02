# Libraries
This folder contains reusable RAML fragments that promote consistent API design throughout the Customer API-led Reference Architecture.

## Design Model

The RAML fragments included in this folder work together to provide:

- **Access control** is defined in the Security Schemes Library.
- **Response behavior** is defined in the Response Traits Library.
- **Response structure** is defined in the Common Responses Library.
- **Data models** are defined in canonical and reusable libraries.

## Data Models

- `lib-canonical-customer-types` -- Defines the canonical customer data model used by Process APIs.

## Response and Behavior

- `lib-common-responses` -- Defines the standard response envelope used across APIs.
- `lib-response-traits` -- Defines standardized HTTP response behavior.

## Security

- `lib-security-schemes` -- Defines reusable security schemes for authentication and authorization.

## Folder Structure

The subfolders adhere to standardized structures to ensure consistency throughout the reference architecture. Each subfolder contains the following components:

- `design/` -- RAML fragments such as libraries, data types, and traits, along with Anypoint Exchange metadata.
- `documentation/` -- Documentation pages published to Anypoint Exchange.
- `README.md` -- Provides an overview and usage guidance.