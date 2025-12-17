---
alwaysApply: true
---

# Starbucks App Development Rules

## Design Principles

- Follow Starbucks color palette (green: #00704A, white, brown tones)
- Maintain minimalistic design approach
- **DO NOT** use linear gradients
- Adhere to established design principles
- This is not an ecommerce application, rather it is a guide for the drinks of starbucks

## Technical Requirements

### State Management

- Use BLoC pattern for all state management

### UI Components

- Create reusable widget components for buttons and input fields
- Ensure unified styling across the app

### Data Layer

- Create repositories for all third-party API calls

### Data Persistence

- Use Drift for local storage
- Implement offline-first architecture

### Models

- When creating a model, use @json_serializable props
- Run build_runner

### Navigation

- Use `go_router` for all navigation
- Add new routes to `go_router` when creating new screens

### Screen Architecture

- Every screen must have two files:
  - `feature_page.dart` - BLoC initialization and provider
  - `feature_view.dart` - Contains the Scaffold and UI
- Structure: Page wraps View, View contains the actual UI
- Example:
  @home/home_page.dart
  @home/home_view.dart

### Dependency Injection

- Register all BLoCs in GetIt service locator
