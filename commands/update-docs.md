---
description: Find and update outdated documentation
---

# Update Documentation

Identify outdated documentation and update it to reflect the current state of the codebase.

## Steps

1. Inventory existing documentation:
   - Find all markdown files (README.md, docs/, CONTRIBUTING.md, CHANGELOG.md).
   - Find inline documentation (JSDoc, docstrings, code comments).
   - Find API documentation (OpenAPI specs, Swagger files).
   - List each document with its last modified date.

2. Check README accuracy:
   - Verify the project description matches current functionality.
   - Verify installation instructions work (correct commands, dependencies, versions).
   - Verify the getting started guide produces a working setup.
   - Check that configuration options are current and complete.
   - Verify listed scripts (build, test, lint) match package.json or equivalent.

3. Check API documentation:
   - Compare documented endpoints against actual routes in the codebase.
   - Verify request/response schemas match current implementations.
   - Check that example requests produce valid responses.
   - Update any endpoints that have been added, removed, or modified.

4. Verify code examples:
   - Run or manually trace each code example in the documentation.
   - Check that imports, function names, and parameters are current.
   - Update examples that reference renamed or removed functions.
   - Add examples for new public APIs that lack documentation.

5. Update configuration documentation:
   - Check that all environment variables are documented.
   - Verify default values match the actual defaults in code.
   - Update any changed configuration options.

6. Check links:
   - Verify internal links between documentation files are not broken.
   - Check that external links (to libraries, services, references) are still valid.
   - Fix or remove broken links.

7. Review and finalize:
   - Read through updated documentation for clarity and consistency.
   - Verify formatting is correct (headers, code blocks, lists).
   - Ensure documentation follows the project's style conventions.

## If Documentation Is Missing Entirely

- Start with a minimal README: project description, installation, usage, and configuration.
- Add API documentation for public endpoints.
- Do not over-document — focus on what users need to get started and what developers need to contribute.

## Output

Updated documentation files with all content reflecting the current codebase. List of files changed and a summary of updates made.
