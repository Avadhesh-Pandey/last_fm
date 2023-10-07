# Top Albums list from Last FM

This is a demo project with infinite list of top albums for an artist on Last.fm, ordered by popularity supporting LIGHT & DARK theme.

Project has been build using clean architecture adhering to the SOLID principles

## Packages

| Purpose          | Package                    |
|------------------|----------------------------|
| State management | Bloc                       |
| HTTP             | dio                        |
| DI               | Get it                     |
| Pagination       | infinite_scroll_pagination |
| Fonts            | google_fonts               |
| Responsive UI    | Screen Utils               |
| Test case        | bloc_test,mockito          |

## Screens

- Home

## Project Architecture

The project is built using clean architecture. It has 2 main directories

- core
    - di
    - usecases

- features
    - data
    - domain
    - presentation

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
