## Overview

This folder contains utility scripts that support development workflows for the Customer API-led Reference Architecture. These scripts automate repetitive tasks, improve consistency, and reduce manual effort when working with Anypoint Platform assets. They operate on design-time artifacts used to publish assets to Anypoint Exchange.

## Available Scripts

### upload-exchange-pages.sh

Uploads Anypoint Exchange documentation pages for a given asset using the Anypoint CLI.

This script automates the process of publishing documentation pages (for example `1-Home.md`, `2-How-to-Consume.md`) to Anypoint Exchange, ensuring consistency across APIs and libraries.

#### Purpose

The `upload-exchange-pages.sh` script helps:

- Standardize how documentation pages are published to Anypoint Exchange.
- Eliminate manual upload steps.
- Ensure consistent page naming and structure.
- Support selective publishing of pages when needed.

#### Requirements

- Anypoint CLI v4 installed (`anypoint-cli-v4`).
- Valid Anypoint Platform credentials configured.
- Access to the target Exchange asset.

#### Usage

```bash
./scripts/upload-exchange-pages.sh \
  -a '<asset-id>' \
  -d '<docs-directory>' \
  -s '<optional-comma-separated-skip-list>'
```

#### Parameters

- `-a` –- Exchange asset ID formatted as  `<group_id>/<asset_id>/<version>`.
Example: `16339d91-3161-43b4-bef8-7e3fbf0af852/lib-common-responses/1.0.0`
- `-d` –- Path to the folder containing Exchange documentation pages.
Example: `./libraries/lib-common-responses`
- `-s` –- Optional list of page titles to skip.
Example: `'Security, Environments and Testing'`

#### Behavior

The script:
1. Maps predefined page titles to expected file names:

	- 1-Home.md -> overrides the default `home` page.
	- 2-How-to-Consume.md -> adds a `How to Consume` page.
	- 3-Security.md -> adds a `Security` page.
	- 4-Environments-and-Testing.md -> adds an `Environments and Testing` page.
	- 5-Getting-Help.md -> adds a `Getting Help` page.

2. Validates that required files exist.
3. Skips pages specified via the `-s` parameter.
4. Uploads each page using:

```code
anypoint-cli-v4 exchange:asset:page:upload \
  "$ASSET_ID" \
  "$TITLE" \
  "$FULL_PATH"
```

#### Conventions

This script assumes the following:

- Documentation files follow the standard naming convention:
	- 1-Home.md
	- 2-How-to-Consume.md
	- 3-Security.md
	- 4-Environments-and-Testing.md
	- 5-Getting-Help.md
- The prefix number defines the page order in Anypoint Exchange.
- Files are located under the `exchange-docs/` folder within each asset directory.

#### Notes

- The Anypoint CLI command used by this script does not support flag-based syntax; arguments must be passed positionally.
- Missing files will result in an error unless explicitly skipped.
- Image uploads are not handled by this script and must be performed manually.

#### Future Enhancements

Potential improvements include:

- Support for uploading images and other assets.
- Dynamic discovery of documentation pages.
- Validation of page content prior to upload.
- Integration with CI/CD pipelines.

## Intended Audience

This folder is intended for:

- API designers.
- MuleSoft developers.
- Platform engineers managing Anypoint Exchange assets.