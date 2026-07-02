# Scripts

This folder contains utility scripts that automate development, synchronization, publication, and maintenance tasks for the Customer API-led Reference Architecture. These scripts improve consistency and reduce manual effort when managing repository assets and their corresponding artifacts in Anypoint Platform.

Examples include:

- Detecting drift between Git and Anypoint Platform assets.
- Synchronizing assets with Design Center.
- Publishing assets to Anypoint Exchange.
- Uploading Exchange documentation pages.
- Supporting local development workflows.

The scripts in this folder primarily synchronize and publish artifacts to Anypoint Platform, where they are maintained primarily for demonstration, experimentation, and validation purposes.

## Available Scripts

### upload-exchange-pages.sh

Uploads documentation pages to Anypoint Exchange using the Anypoint CLI. This script automates publishing standard documentation pages, including:

- Home
- How to Consume
- Security
- Environments and Testing
- Getting Help
