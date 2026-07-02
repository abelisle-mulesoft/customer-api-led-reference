# APIs
This folder contains the APIs that comprise the Customer API-led Reference Architecture.

## Process APIs

- `customer-papi` -- Orchestrates customer data across systems using the canonical model.

## System APIs

System APIs expose data aligned with the underlying systems and avoid transforming it into the canonical model.

- `oracle-ebs-customer-sapi` -- Provides access to Oracle EBS customer data.
- `sap-ecc-customer-sapi` -- Provides access to SAP ECC customer data.
- `sf-brilm-customer-sapi` -- Provides access to Salesforce (Brilliant Mule) customer data.
- `sf-umbre-customer-sapi` -- Provides access to Salesforce (Umbrella) customer data.

## Folder Structure

API projects adhere to standardized folder structures to ensure consistency throughout the reference architecture. Each API project contains the following components:

- `design/` -- RAML specifications, fragments, and Anypoint Exchange metadata.
- `documentation/` -- Documentation pages published to Anypoint Exchange.
- `implementation/` -- Mule application implementation artifacts.
- `README.md` -- Provides an overview and usage guidance.
