---
description: Run OWASP-based security audit on the codebase
---

# Security Check

Perform a comprehensive security audit based on OWASP guidelines to identify vulnerabilities.

## Steps

1. Scan for hardcoded secrets:
   - Search for API keys, passwords, tokens, and connection strings in source files.
   - Check for patterns like `sk-`, `api_key =`, `password =`, `secret =`, `token =`.
   - Review `.env.example` to ensure no real values are committed.
   - Verify `.gitignore` includes `.env`, credentials files, and key files.

2. Check input validation:
   - Review all API endpoints and form handlers.
   - Verify all user inputs are validated with a schema (zod, joi, etc.).
   - Check that validation happens on the server side, not just client side.
   - Ensure file uploads are restricted by type and size.

3. Review authentication and authorization:
   - Verify authentication is required on all protected routes.
   - Check that authorization checks enforce proper access levels.
   - Ensure passwords are hashed with bcrypt, argon2, or scrypt (never MD5 or SHA1).
   - Verify session tokens and JWTs have proper expiration.

4. Check for injection vulnerabilities:
   - SQL injection: Verify all queries use parameterized statements or an ORM.
   - NoSQL injection: Check that user input is not passed directly to query operators.
   - Command injection: Ensure no user input reaches shell commands or exec calls.

5. Check for XSS vulnerabilities:
   - Verify HTML output is escaped or sanitized.
   - Check that `dangerouslySetInnerHTML` or equivalent is not used with user input.
   - Review Content-Security-Policy headers.

6. Check for CSRF protection:
   - Verify CSRF tokens are used on state-changing requests.
   - Check SameSite cookie attributes.

7. Review error handling:
   - Ensure error messages do not expose stack traces, file paths, or internal details to users.
   - Verify that generic error messages are returned in production.

8. Check dependencies:
   - Run `npm audit`, `pip audit`, or equivalent for the project's package manager.
   - Review any HIGH or CRITICAL vulnerabilities.
   - Check for outdated dependencies with known CVEs.

9. Review rate limiting:
   - Verify rate limiting is applied to authentication endpoints.
   - Check that API endpoints have appropriate rate limits.

## If Critical Issues Are Found

- Stop all other work immediately.
- Fix the critical vulnerability before continuing.
- If secrets were exposed, rotate them immediately.
- Search the codebase for similar patterns.

## Output

A security report listing each finding with severity (CRITICAL/HIGH/MEDIUM/LOW), affected file and line, description, and recommended remediation.
