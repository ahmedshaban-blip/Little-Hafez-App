# **AGENTS.md — Flutter Engineering Contract**

Severity keywords:

* **MUST**: Hard rule. No exceptions without explicit user approval.  
* **NEVER**: Strictly forbidden.  
* **VERIFY**: Mandatory check before reporting a task as complete.

## **0\. Project Profile (Fill Per Project)**

> Update only this section when dropping this file into a new Flutter project.

* **App Name & Purpose**: `LittleHafiz`  
* **Backend / API**: `not decided yet`  
* **DI & Navigation**: `get_it + GoRouter `  
* **Localization & Direction**: `AR (default, RTL) + EN (LTR) via l10n ARB`  
* **Responsive Scaling**: `flutter_screenutil (.w/.h/.r/.sp)`  
* **Design System Path**: `lib/core/theme/`
* **Codegen**: `None (hand-written models)`  
* **Extra Project Notes**: `this project is for my kids to help them learn quran and azkar `

## **1\. Architecture — Strict Feature-Based Clean Architecture**

Every business capability MUST live under `lib/features/<feature>/`. Only genuinely app-wide, domain-agnostic code lives in `lib/core/` or `lib/app/`. Omit any subfolder a feature does not need — **NEVER** ship empty folders.

```
lib/
├── main.dart                     # Bootstrap only (env, backend init, DI, runApp)
├── app/                          # App-wide wiring: MaterialApp, routes, global providers
│   ├── app.dart
│   ├── routes.dart
│   └── di/                       # Service locator / BlocProvider registration per feature
├── core/                         # Feature-agnostic infrastructure & shared UI
│   ├── theme/                    # Single source of truth for Design Tokens & ThemeData
│   ├── networking/               # HTTP/Backend clients, interceptors, ErrorMapper
│   ├── errors/                   # Failure/Exception base types
│   ├── widgets/                  # Domain-agnostic widgets used by 2+ features
│   └── utils/                    # Pure helpers, validators, extensions
├── l10n/                         # ARB localization files + generated localizations
└── features/
    └── <feature_name>/
        ├── domain/               # Entities + abstract repository interfaces (Pure Dart ONLY)
        ├── data/                 # Models/DTOs, data sources, repository implementations
        ├── logic/                # Cubits + immutable States
        └── presentation/         # Screens, body views, widgets, view-only controllers
            ├── screens/          # Composition + BlocProvider + BlocListener only
            └── widgets/          # One public widget per file (group in subfolders if complex)

```

### **Dependency Rules (NEVER Broken)**

* **Direction**: `presentation → logic → domain ← data`.  
* `domain/` MUST be pure Dart — **NEVER** import `flutter/*`, backend SDKs, or `data/`.  
* `data/` implements `domain/` contracts and maps raw exceptions into typed failures.  
* `presentation/` **NEVER** calls repositories, data sources, or network clients directly — only via a `Cubit`.  
* **No cross-feature imports**: A feature MUST NOT import another feature's `data/`, `domain/`, or `logic/`. Share cross-feature contracts via `lib/core/`.

## **2\. State Management — Cubit (STRICT)**

* **Cubit only** (`flutter_bloc`). **NEVER** use `ChangeNotifier`, `Provider`, or `ValueNotifier` for business/feature state.  
* `setState()` is allowed **ONLY** for purely ephemeral, view-local UI state (`TextEditingController`, focus, scroll, animation flags, local expand/collapse) — **NEVER** for async data, loading, error, or navigation state.  
* One Cubit per cohesive domain flow (`<Feature><Purpose>Cubit`). **NEVER** merge unrelated domains into one Cubit.  
* Cubits MUST be pure Dart (unit-testable without `BuildContext` or widget tree). **NEVER** pass `BuildContext` into a Cubit or import UI widgets inside `logic/`.  
* Always guard `emit(...)` against closed Cubits (`if (isClosed) return;`) after async gaps.

### **State Modeling Rules**

Choose the right immutable state pattern per flow:

1. **Mutually exclusive async flows** (e.g., fetch list, submit action) → **Dart 3 `sealed class`** with `final class` subclasses (`Initial`, `Loading`, `Success`, `Error`).  
2. **Multi-field / interactive screens** (e.g., forms, filters, dashboards with partial updates) → Single `@immutable` state class with `copyWith` and value equality (`Equatable` or `==`/`hashCode`) and explicit status enums.  
* `BlocBuilder`/`BlocConsumer`/`context.select` MUST specify concrete state types — **NEVER** `dynamic`.

### **Listener vs Builder Separation**

* Use `BlocListener` at the **Screen** level for one-off side effects (SnackBars, dialogs, navigation).  
* Use `BlocBuilder` scoped to the **smallest** subtree that actually rebuilds, with `buildWhen`/`listenWhen` wherever applicable.

## **3\. Dependency Injection & SOLID**

* Register persistent infrastructure (network clients, secure storage, repositories) as lazy singletons (`registerLazySingleton`).  
* Register Cubits as factories (`registerFactory`) and scope them via `BlocProvider` at the route/screen boundary — **NEVER** instantiate a Cubit or repository inside `build()` or `initState()`.  
* **SRP**: One class \= one reason to change. No god `Manager`/`Helper`/`Utils` classes.  
* **OCP**: Extend behavior via composition, new implementations, or optional parameters with defaults — avoid switch-heavy edits.  
* **LSP**: Every repository implementation and sealed state subclass MUST honor its parent contract.  
* **ISP**: Split fat repository interfaces by concern; pass explicit typed props/callbacks (`ValueChanged<T>`, `VoidCallback`) to widgets instead of raw `Function` or full Cubits.  
* **DIP**: Cubits depend on abstract repository interfaces injected via constructor.

## **4\. Networking, Data & Error Handling**

* All network/backend clients live in `lib/core/networking/`. **NEVER** instantiate `Dio`, `Supabase`, or HTTP clients inside a feature.  
* Models MUST be immutable (`final` fields, `const` constructors where possible) with explicit `fromJson`/`toJson`. Zero serialization logic in UI or Cubits.  
* **Boundary-Only Error Handling**:  
  * Catch raw exceptions at the **Data/Repository boundary** and map them through a centralized `ErrorMapper` into user-friendly `Failure` objects.  
  * Handle `Failure` results cleanly in the **Cubit** and emit an error state rendered by a dedicated error widget.  
  * **NEVER** expose raw stack traces, SQL errors, or HTTP codes to users.  
  * **NEVER** wrap random internal helper functions in blind `try/catch` blocks that swallow bugs.

## **5\. Design System & Tokens (STRICT)**

**No hardcoded visual literals anywhere in `lib/features/` or `lib/core/widgets/`.** Raw color, spacing, radius, and typography values may exist **ONLY** in `lib/core/theme/`.

* **Forbidden in features**: `Color(0x...)`, `Color.fromARGB(...)`, `Colors.red`, `Colors.grey.shade600`, magic `EdgeInsets.all(17)`, inline unstyled `TextStyle(...)`.  
* **Required**: Consume tokens via `ThemeExtension` (e.g., `context.colors.*`), `Theme.of(context).colorScheme.*`, `AppSpacing.*`, `AppRadii.*`, and `AppTypography.*` (using `.copyWith(...)` for minor derivations).  
* If a needed token does not exist, add it to `lib/core/theme/` first, then reference it.  
* Both Light and Dark themes MUST derive from tokens — **NEVER** branch on `Theme.of(context).brightness` inside widgets to pick raw colors.  
* **Loading States**: For content/data loading, MUST render a layout-matching **Shimmer skeleton** (`AppShimmer` / skeleton widget) rather than a bare `CircularProgressIndicator`. Reserve small spinners strictly for in-button submission states.  
* **RTL & L10n**: All user-facing strings MUST live in ARB files (no hardcoded UI strings). Layouts MUST be RTL-safe (`EdgeInsetsDirectional`, `AlignmentDirectional`, `BorderRadiusDirectional`).

## **6\. Widget Contracts & Decomposition (STRICT)**

### **3-Tier Presentation Separation**

1. **Screen (`<name>_screen.dart`)**: Composition only — `BlocProvider`, `BlocListener`, `Scaffold`, and wiring. Zero heavy layout trees or business logic.  
2. **Body (`<name>_body.dart`)**: Pure `StatelessWidget` layout composition receiving typed data and callbacks via constructor. No `context.read`/`watch` calls.  
3. **Child Widgets (`widgets/<snake_case>.dart`)**: Single visual/interactive concern each (card, tile, banner, form section).

### **Rules & Reuse**

* **One public widget per file** (`file_name.dart` matches `FileName`).  
* **Props over context**: Pass data and semantic callbacks (`onAddToCart(item)`, not `onTap(index)`) via constructor.  
* Prefer `StatelessWidget` and `const` constructors everywhere possible.  
* **No `_buildXxx()` helper methods** returning complex widget trees — extract a proper `StatelessWidget` class instead.  
* View-only controllers live in `presentation/controllers/`, not cluttering widget files.  
* **Promotion Rule**: Inspect `lib/core/widgets/` before creating a component. Promote a widget to `lib/core/widgets/` **ONLY** when it is domain-agnostic and reused by **2+ features**. Verify all call sites before changing shared widget parameters.

### **Hard Size Limits & Extraction Triggers**

Exceeding any limit below is a mandatory extraction trigger:

| File / Unit | Limit | Required Action |
| :---- | :---- | :---- |
| Widget file | ≤ 150 lines | Extract sub-widgets to `presentation/widgets/` |
| Screen file | ≤ 120 lines | Move sections/dialogs/body to dedicated widgets |
| Cubit file | ≤ 200 lines | Split into cohesive domain-specific Cubits |
| Model / Repository | ≤ 200 lines | Split nested DTOs or segregate interfaces |
| `build()` method | ≤ 50–60 lines | Extract child widget class |
| Widget nesting | ≤ 5 levels (≤ 3 for conditionals/builders) | Extract leaf/section widget |

## **7\. Code Style & Safety**

* Prefer `final` over `var`; use `const` constructors and trailing commas for clean diffs.  
* Avoid unsafe `as` casts — use `is` checks and pattern matching.  
* Always check `if (!context.mounted) return;` before using `BuildContext` across async gaps.  
* Delete unused imports and dead code in the same commit. Before deleting shared code, grep all references first.  
* Keep changes atomic and focused — no unrelated shotgun edits.  
* **Secrets Hygiene**: NEVER print, log, or commit `.env`, `key.properties`, `*.jks`, or raw API keys.

## **8\. Testing Expectations**

* **Cubit Tests**: Verify state transitions, error mapping, and repository call sequences using mocked repository interfaces.  
* **Widget Tests**: Mock the Cubit/props, verify UI renders each state (Loading/Shimmer, Success, Error), and verify callbacks fire with expected payloads.  
* Tests MUST run offline without live backend dependencies.

## **9\. Verification Gates (Definition of Done)**

Before reporting any non-trivial task as complete, **VERIFY** all gates pass in order:

```
# 1. Format (project-wide if clean, or edited files only: dart format <files>)
dart format .

# 2. Static analysis (MUST introduce zero new warnings/errors)
flutter analyze

# 3. Raw color / hardcoded style leak check
rg "Color\(0x|Colors\.[a-zA-Z]" lib/features lib/core/widgets lib/app

# 4. Automated tests (zero regressions)
flutter test

```

### **Final Checklist**

* \[ \] Code placed strictly in `lib/features/<feature>/<layer>/` (no cross-feature imports; pure `domain/`).  
* \[ \] Cubit \+ immutable state; `isClosed` guarded; DI wired cleanly.  
* \[ \] Zero hardcoded colors, spacing, radii, or user-facing strings; RTL-safe.  
* \[ \] Screen/Body/Child separation respected; all file size limits honored.  
* \[ \] All verification gates green (a red gate means the task is NOT done — report the failure).

## **10\. Cross-Agent Project Memory (Optional for Large Projects)**

When working on multi-session projects, maintain concise factual state under `memory/`:

* `memory/project_context.md` — Stable architecture & stack overview.  
* `memory/current_state.md` — Active task, verified status, blockers, next steps.  
* `memory/decisions.md` — Architectural decisions (ADRs) and rationale.  
* `memory/lessons.md` — Verified bugs, root causes, and prevention rules.

Read `memory/` before complex tasks; update only after verified milestones.

&nbsp;