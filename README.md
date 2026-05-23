# TB Training Logs

A Flutter application for generating and tracking structured hybrid training plans based on the **Tactical Barbell Green Protocol** (Hybrid/Op continuation model).

The app focuses on combining strength training progression with conditioning work, while allowing users to track workouts, intensity, and progression over time.

---

## Overview

This project implements a **rule-based training plan generator** inspired by Tactical Barbell principles:

- Hybrid training structure (strength + conditioning)
- Cyclical progression (Operator / Fighter blocks)
- Intensity-based loading (percentage of 1RM)
- Structured weekly templates
- Long-term periodization across multiple cycles

Each plan is generated dynamically based on user input such as:
- Training priority (strength vs conditioning emphasis)
- Number of cycles
- Exercise selection
- 1RM inputs

---

## Key Features

### Training System
- Operator / Fighter weekly structure
- Progressive intensity blocks (e.g. 70%, 80%, 90%)
- Strength sessions with configurable exercises
- Conditioning sessions (easy run, long run, speed work, rest)

### Exercise Prescription
- Automatic calculation of:
  - Target weight (% of 1RM)
  - Sets and reps based on intensity zones
- Support for multiple movement patterns:
  - Push
  - Pull
  - Legs
  - Deadlift

### Plan Management
- Create training plans from a form-based setup
- View active, completed, and archived plans
- Switch plan status dynamically
- Persist data locally using Hive

### UI Features
- Day-by-day workout view
- Workout detail dialogs
- Notes per workout day
- Simple plan dashboard with navigation

---

## Architecture

The app follows a layered structure:

- **Domain layer**
  - TrainingPlan
  - WorkoutDay
  - Exercise models
  - Enums (WorkoutType, PlanStatus)

- **State management**
  - Riverpod (StateNotifier-based plan management)

- **Persistence**
  - Hive local database
  - Code-generated adapters (`.g.dart` files)

- **Presentation**
  - Flutter UI widgets for plans and workouts

---

## Training Model

### Weekly Structure

- **Operator Phase (Weeks 1–3)**
  - Higher volume strength work
  - Moderate conditioning

- **Fighter Phase (Weeks 4–6)**
  - Lower volume strength work
  - Increased conditioning emphasis

This cycle repeats based on user-defined training length.

---

## Intensity System

Strength sessions are driven by percentage-based loading:

| Intensity | Sets | Reps |
|----------|------|------|
| 70%      | 3–5  | 5    |
| 75%      | 3–5  | 5    |
| 80%      | 3–5  | 5    |
| 85%      | 3–4  | 3–4  |
| 90%      | 3–4  | 2–3  |
| 95%      | 3–4  | 1–2  |

Weights are calculated automatically using user-provided 1RM values.

---

## Tech Stack

- Flutter
- Dart
- Riverpod (state management)
- Hive (local storage)
- intl (date formatting)
- uuid (ID generation)

---

## Local Storage

The app uses Hive for persistence:

- Training plans are stored locally
- Each plan contains full workout schedules
- Data survives app restarts

Generated adapters (`*.g.dart`) are used for serialization.

---

## Project Status

This project is actively evolving. Current focus areas:

- Improving data model architecture
- Expanding exercise library
- Adding calendar integration
- Enhancing plan lifecycle management
- UI simplification and filtering (active / completed / archived)

---

## Future Improvements

- Calendar sync (Google / Apple Calendar)
- Workout completion tracking
- Progress analytics
- Exercise database expansion
- Better separation between domain and persistence layers
- Offline-first architecture improvements

---

## Notes

This project is a practical implementation of a hybrid strength & conditioning system inspired by Tactical Barbell principles. It is not an official implementation of the methodology, but a personal training tool and experiment in structured programming design.

---

## License

This project is for personal and educational use.
