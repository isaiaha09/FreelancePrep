# ARCHITECTURE.md

## Project

FreelancePrep

## Product Goal

Provide freelancers with a simple, privacy-conscious application for estimating project profitability, tracking work, and understanding their actual earnings.

## Technology Stack

### Core

- Swift 6.4.2
- Swift Package Manager
- Swift Testing
- Cross-platform business logic

### iOS Application (Planned)

- SwiftUI
- Native iOS navigation and components
- Local persistent storage
- PDF export
- StoreKit for a potential one-time premium unlock

## Architecture Principles

1. Offline-first design.
2. Business logic independent of the user interface.
3. Minimal external dependencies.
4. Testable calculations and data models.
5. Clear separation of responsibilities.
6. User-controlled local data.

## Repository Structure

```text
FreelancePrep/
├── AGENTS.md
├── ARCHITECTURE.md
├── ROADMAP.md
├── STATUS.md
├── Package.swift
├── Sources/
│   └── FreelancePrepCore/
│       ├── Models/
│       ├── Services/
│       ├── Calculations/
│       └── Persistence/
└── Tests/
    └── FreelancePrepCoreTests/
```

This is the intended structure. Agents should inspect the actual repository before creating directories or moving files.

The native iOS application target will be added separately when development moves to Xcode.

## Core Components

### Models

Represent application data, including:

- Freelance projects
- Project estimates
- Time entries
- Expenses
- Project financial summaries

### Services

Coordinate application operations, including:

- Project management
- Time tracking
- Expense management
- Financial reporting

### Calculations

Perform deterministic financial calculations, including:

- Estimated revenue
- Project expenses
- Estimated profit
- Effective hourly rate
- Differences between estimated and actual performance

### Persistence

Provide an abstraction for storing and retrieving application data.

The initial implementation should remain independent of platform-specific storage APIs.

SQLite is a candidate for local persistence. The final storage implementation will be selected when persistence is developed.

## Financial Calculation Rules

Proposed initial calculations:

**Estimated hourly rate**

Estimated revenue / Estimated hours

**Project profit**

Revenue - Expenses

**Effective hourly rate**

Project profit / Actual hours worked

Calculation behavior for zero hours, negative values, currency rounding, and incomplete projects must be defined and tested before implementation.

## Data Flow

1. User enters project information through the iOS interface.
2. The interface calls a core service.
3. The service validates the input.
4. The core models and calculation components process the data.
5. The persistence layer stores changes locally.
6. The interface displays the updated result.

## Platform Boundaries

### Windows

Windows development is used for:

- Swift package development
- Business logic
- Models
- Calculations
- Unit testing

### macOS / Xcode

macOS development will be used for:

- SwiftUI interface
- iOS simulator testing
- Native platform integrations
- App signing and distribution

## Security and Privacy

- Keep project data on-device by default.
- Do not introduce analytics or external data collection without approval.
- Do not store sensitive information in source control.
- Avoid unnecessary network permissions.

## Future Architectural Decisions

The following remain undecided:

- Final persistence implementation
- Data migration strategy
- PDF generation approach
- Backup and restore
- Premium feature boundaries
- Minimum supported iOS version