# ROADMAP.md

## FreelancePrep Development Roadmap

### Phase 0 — Development Foundation

- [x] Initialize Swift Package Manager project.
- [x] Configure Swift development on Windows.
- [x] Verify `swift build`.
- [x] Verify `swift test` using the native SwiftPM backend.
- [ ] Establish project documentation.
- [ ] Confirm Git repository and branching workflow.

**Completion criteria:** The core package builds and tests successfully, and development instructions are documented.

### Phase 1 — Core Data Models

- [ ] Create project model.
- [ ] Create estimate model.
- [ ] Create expense model.
- [ ] Create time-entry model.
- [ ] Define validation rules.
- [ ] Write model tests.

**Completion criteria:** Models represent the required project information and pass unit tests.

### Phase 2 — Financial Calculations

- [ ] Calculate estimated hourly rate.
- [ ] Calculate project expenses.
- [ ] Calculate estimated profit.
- [ ] Calculate actual profit.
- [ ] Calculate effective hourly rate.
- [ ] Handle invalid and incomplete inputs.
- [ ] Write calculation tests.

**Completion criteria:** Financial calculations produce verified results for normal and edge cases.

### Phase 3 — Project Management

- [ ] Create projects.
- [ ] Edit projects.
- [ ] Delete projects.
- [ ] Record time worked.
- [ ] Record project expenses.
- [ ] Generate project summaries.
- [ ] Test project management operations.

**Completion criteria:** Projects can be managed through the core services.

### Phase 4 — Local Persistence

- [ ] Select local storage implementation.
- [ ] Implement persistence interfaces.
- [ ] Save and retrieve projects.
- [ ] Persist time entries and expenses.
- [ ] Define data migration strategy.
- [ ] Test persistence and recovery behavior.

**Completion criteria:** Project data remains available across application restarts.

### Phase 5 — Native iOS Interface

- [ ] Create native iOS application target.
- [ ] Integrate FreelancePrepCore.
- [ ] Build project dashboard.
- [ ] Build project creation and editing screens.
- [ ] Build time and expense entry screens.
- [ ] Display financial summaries.
- [ ] Implement navigation and accessibility.
- [ ] Validate on iOS simulator and device.

**Completion criteria:** Users can manage a complete project through the iOS interface.

### Phase 6 — Reports and Export

- [ ] Define report contents.
- [ ] Generate project financial summaries.
- [ ] Implement PDF export.
- [ ] Implement native iOS sharing.
- [ ] Test report accuracy.

**Completion criteria:** Users can export readable, accurate project reports.

### Phase 7 — Monetization

- [ ] Define free and premium features.
- [ ] Implement StoreKit purchase integration.
- [ ] Implement purchase restoration.
- [ ] Test entitlement handling.

**Completion criteria:** Premium features are correctly gated and purchases can be restored.

### Phase 8 — Release Preparation

- [ ] Complete functional testing.
- [ ] Complete accessibility review.
- [ ] Review data privacy requirements.
- [ ] Prepare App Store metadata and screenshots.
- [ ] Distribute through TestFlight.
- [ ] Resolve beta feedback.
- [ ] Submit for App Store review.

**Completion criteria:** The application is ready for public distribution.

## Development Priorities

Current priority: Phase 0, followed by Phase 1.

Do not begin later phases without checking prerequisites and dependencies.

Independent tasks may run in parallel when their interfaces and file ownership are clearly defined.