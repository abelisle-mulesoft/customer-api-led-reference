## Support

If you need assistance using the Common Response Types Library, contact the integration platform support team at [support@brilliantmule.com](mailto:support@brilliantmule.com).

Support hours: Monday through Friday, 9:00 AM – 5:00 PM Pacific Time.

The target response time for support inquiries is within four business hours during support hours.

## Before Requesting Support

Before opening a support request, please review the following resources:

- The **Home** and **How to Consume** documentation pages of this asset.
- The [Code Taxonomy Guide](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/guide-code-taxonomy) in the Platform Standards business group.
- Your API specification to confirm the RAML library was imported correctly.
- The examples provided in the library and supporting documentation.

These resources address the most common usage patterns and design questions.

## Information to Include in Your Request

Providing the following information will help the support team respond more quickly:

- Exchange asset name and version (example: lib-common-responses -- v1.0.0).
- Name of the API that is using the library.
- Description of the issue or question.
- RAML snippet showing how the library is being used.
- Error messages or logs, if applicable.
- A small payload example demonstrating the issue, if relevant.

Including a minimal reproducible example greatly improves the ability to diagnose design and integration problems.

## Intended Usage

This asset provides the standard response envelope for all Brilliant Mule APIs. Support requests should be related to:

- Importing the RAML library into an API specification.
- Using `ApiResponse`, `ResponseDetail`, or related types in API specifications.
- Constraining `ApiResponse.data` for operation-specific payloads.
- Understanding the relationship between HTTP status, `ApiResponse.status`, and `ResponseDetail.severity`.
- Applying the [Code Taxonomy Guide](https://anypoint.mulesoft.com/exchange/16339d91-3161-43b4-bef8-7e3fbf0af852/guide-code-taxonomy) standard in `ResponseDetail.code`.

Support requests outside of this scope may be redirected to the appropriate API or domain team. Questions related to domain-specific payload design or system-specific implementation details should be addressed within the owning API project. 

## Contribution and Feedback

Feedback and improvement suggestions are encouraged. Where applicable, proposed changes should align with existing platform standards and design principles. Suggestions that improve clarity, interoperability, consistency, or reuse across APIs are particularly valuable. If you identify documentation gaps or recommended improvements to the data model or usage patterns, submit feedback through your integration architecture or platform enablement team.
