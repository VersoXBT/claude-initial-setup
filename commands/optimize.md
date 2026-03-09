---
description: Profile and optimize application performance
---

# Performance Optimization

Profile the application to identify bottlenecks, then apply targeted optimizations with before/after benchmarks.

## Steps

1. Establish a baseline:
   - Identify the slow operation or endpoint.
   - Measure current performance (response time, execution time, memory usage).
   - Record the baseline numbers for comparison.

2. Profile the application:
   - For frontend: Check bundle size, render performance, and network requests.
   - For backend: Profile API response times, database query times, and memory allocation.
   - For general code: Use profiling tools to identify hot paths and bottlenecks.

3. Identify the top bottlenecks:
   - Rank issues by impact (largest time or resource savings first).
   - Focus on the top 3 bottlenecks — do not optimize everything at once.
   - Verify each bottleneck is real, not a profiling artifact.

4. Apply optimizations one at a time:
   - Database: Add missing indexes, fix N+1 queries, optimize slow queries, add pagination.
   - Computation: Memoize expensive calculations, use caching (in-memory or Redis), debounce/throttle frequent operations.
   - Rendering: Lazy-load components and routes, virtualize long lists, reduce unnecessary re-renders.
   - Network: Compress responses, batch API calls, implement proper caching headers.
   - Bundle: Code-split large bundles, tree-shake unused imports, lazy-load heavy dependencies.

5. Benchmark after each optimization:
   - Re-run the same measurement from step 1.
   - Compare against the baseline.
   - If the optimization shows no measurable improvement, revert it.
   - If the optimization introduces regressions, revert and try a different approach.

6. Run the full test suite:
   - Verify no functionality was broken by optimizations.
   - Performance improvements must not come at the cost of correctness.

## If Optimization Introduces Bugs

- Revert the optimization immediately.
- Analyze why it broke — incorrect assumptions about data flow or state.
- Find an alternative approach that preserves correctness.

## Output

A performance report showing each optimization applied, with before/after measurements and percentage improvement.
