# GlobalFlavors

> Discover authentic regional dishes near you, swap local ingredients instantly, and send groceries to your cart in one tap. Enjoy the best the world has to offer right from your dinner table.

**Course:** CSC305 Software Development Capstone
**Institution:** University of Rhode Island, Fall 2025
**Team:** Juan, Jack, Sophia, Maria, Alex

---

## Features

| Feature | Status |
|---------|--------|
| Recipe browsing | Implemented |
| User accounts | Implemented |
| AI recommendations | Planned |
| Social sharing | Planned |

---

## Quick Start

```bash
# 1. Clone the repo
git clone git@github.com:juanvallejo97/GlobalFavors.git
cd GlobalFlavors

# 2. Install dependencies
flutter pub get

# 3. Run the app
flutter run
```

**Requirements:** Flutter SDK (stable release)

---

## Documentation

| Document | Description |
|----------|-------------|
| [Team Standards](docs/TEAM_STANDARDS.md) | Commit format, PR guidelines |
| [Code of Conduct](docs/CONDUCT.md) | Team behavioral standards |
| [Business Plan](docs/BUSINESSPLAN.md) | Project overview and goals |
| [Test Cases](docs/TESTCASES.md) | Testing documentation |
| [User Research](docs/UserResearch.md) | User research findings |
| [A/B Testing](docs/ABTEST.md) | A/B test strategy |
| [Metrics](docs/METRICS.md) | Success metrics |
| [Personas](docs/PERSONAS.md) | User personas |

---

## Integration Tests

To test on a real iOS / Android device, first connect the device and run:

```bash
flutter test integration_test/test.dart
```

To test on a web browser, first launch `chromedriver`:
```bash
chromedriver --port=4444
```

Then run:
```bash
flutter drive \
  --driver=test_driver/integration_test.dart \
  --target=integration_test/test.dart \
  -d chrome
```

More info: [Flutter Integration Tests](https://docs.flutter.dev/cookbook/testing/integration/introduction#5-run-the-integration-test) | [Firebase Test Lab](https://github.com/flutter/flutter/tree/main/packages/integration_test#firebase-test-lab)
