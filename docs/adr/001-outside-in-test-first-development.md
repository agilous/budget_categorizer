# ADR-001: Outside-In, Test-First Development Strategy

**Status:** Accepted

**Context:**

*   This is a Ruby on Rails.
*   A consistent and reliable testing strategy is required to ensure new features meet requirements, prevent regressions, facilitate refactoring, and maintain high code quality.
*   The current testing stack utilizes Cucumber and RSpec, and follows standard Rails/RSpec conventions.
*   There is a desire to follow a behavior-driven, "Test-First" approach, ensuring that development is guided by specifications derived from user requirements and that features are validated from the user's perspective down to the individual code units.

**Decision:**

We will adopt an **Outside-In, Test-First** development strategy for all new feature development and significant refactoring. This involves writing tests *before* the implementation code, starting from the highest level of interaction and working inwards.

The testing layers, in order of development, are:

1.  **Feature Tests (UI/End-to-End):**
    *   **Purpose:** Verify complete user workflows and interactions through the UI, ensuring the frontend (Hotwire) and backend (Rails/Postgresql) integrate correctly. Simulate real user behavior.
    *   **Tooling:** Cucumber feature specs.
    *   **Approach:** Write a failing test that describes the desired user interaction and outcome *first*. Focus on critical paths and high-level acceptance criteria.

2.  **Request / Integration Tests (Controller/API):**
    *   **Purpose:** Test the behavior of API endpoints (GraphQL mutations/queries, REST controllers) directly. Verify request handling, response structure, status codes, authentication/authorization, and integration with underlying services or models *without* involving the UI.
    *   **Tooling:** RSpec Request Specs.
    *   **Approach:** If a system test requires new or modified API interactions, write failing request specs *next* to define the expected API contract.

3.  **Service / Job / Operation / Form / Query Tests (Business Logic):**
    *   **Purpose:** Test the core business logic encapsulated within service objects, background jobs, operations, form objects, query objects, etc.
    *   **Tooling:** RSpec unit/integration specs for these specific classes. Use mocks/stubs for external dependencies or collaborators where appropriate to isolate the logic under test.
    *   **Approach:** As controller/API tests reveal the need for specific business logic implementation, write failing specs for these intermediate objects *next*, defining their inputs, outputs, and side effects.

4.  **Model / Unit Tests:**
    *   **Purpose:** Test the smallest units of code, primarily ActiveRecord models. Verify validations, scopes, associations, instance/class methods, and data integrity rules in isolation.
    *   **Tooling:** RSpec Model Specs.
    *   **Approach:** Write failing model specs *last* to implement the data-level logic, validations, and persistence behavior required by the higher-level tests.

**Development Flow:**

1.  Start with a failing Feature test describing the user-facing requirement.
2.  Write failing Request/Integration tests needed to make the System test progress.
3.  Write failing Service/Job/Operation/etc. tests needed for the Request tests.
4.  Write failing Model/Unit tests needed for the Service/Job/etc. tests.
5.  Write the minimum implementation code at each level to make the corresponding tests pass.
6.  Refactor the code and tests, ensuring all tests remain green.
7.  Repeat until the initial System/Feature test passes.

**Consequences:**

*   **Positive:**
    *   Increased confidence that features work as intended from the user's perspective.
    *   Development is guided by requirements, reducing ambiguity.
    *   Promotes better design, encouraging modularity and clear interfaces testable at different levels.
    *   Provides living documentation of system behavior.
    *   Reduces regressions during refactoring or future development.
    *   Encourages testing of distinct layers (UI, API, Business Logic, Data).
*   **Negative:**
    *   Potentially slower initial development velocity as tests are written upfront.
    *   System/Feature tests can be slower to run and may require more maintenance if UI structure changes frequently or if they are not written robustly.
    *   Requires team discipline to consistently follow the test-first approach across all layers.
*   **Neutral:**
    *   Relies on the existing RSpec framework and potentially requires configuring/maintaining system testing tools (e.g., Capybara drivers, potentially Cypress).
