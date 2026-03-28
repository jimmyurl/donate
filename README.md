# 🗺️ Tanzania Regions — Flutter Map Picker

An interactive Flutter widget that lets users explore and select Tanzania's regions via a tap-on-map or scrollable list interface.



## ✨ Features
# 💚 GiveNow — Flutter Donation App

A mobile application built with Flutter to facilitate donations to various charities and track your giving history — all in one clean, intuitive interface.



## ✨ Features

- **Charity discovery** — browse vetted charities across multiple cause categories
- **Category filtering** — filter by Education, Health, Environment, Hunger, and more
- **Fundraising progress** — live progress bars showing how close each charity is to its goal
- **Quick donation flow** — preset amounts with a one-tap donate button
- **Impact preview** — see exactly what your donation achieves before you give
- **Donation history** — full log of past donations grouped by month
- **User profile** — personal giving stats, favourite causes, and streak tracking
- **Settings** — manage payment methods, tax receipts, and notifications



## 📸 Screens

| Home | Charity Detail | History | Profile |
|---|---|---|---|
| Browse & filter charities | Select amount & see impact | Monthly donation log | Stats, causes & settings |



## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart `>=3.0.0`

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/jimmyurl/donate.git
cd givenow-flutter
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Run the app**

```bash
flutter run
```

---

## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| [`flutter_svg`](https://pub.dev/packages/flutter_svg) | `^2.0.0` | SVG rendering for charity logos and icons |
| [`http`](https://pub.dev/packages/http) | `^1.2.0` | API calls to charity and payment backends |
| [`provider`](https://pub.dev/packages/provider) | `^6.1.0` | State management across screens |
| [`intl`](https://pub.dev/packages/intl) | `^0.19.0` | Currency and date formatting |

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_svg: ^2.0.0
  http: ^1.2.0
  provider: ^6.1.0
  intl: ^0.19.0
```

---

## 🗂️ Project Structure

```
lib/
├── main.dart                        # App entry point
├── models/
│   ├── charity.dart                 # Charity data model
│   ├── donation.dart                # Donation record model
│   └── user.dart                    # User profile model
├── screens/
│   ├── home_screen.dart             # Charity browse & filter
│   ├── detail_screen.dart           # Charity detail & donation flow
│   ├── history_screen.dart          # Donation history log
│   └── profile_screen.dart          # User profile & settings
├── widgets/
│   ├── charity_card.dart            # Charity list card with progress bar
│   ├── category_chip.dart           # Filterable category pill
│   ├── donation_item.dart           # History list row
│   ├── impact_card.dart             # Dashboard summary card
│   └── quick_amount_selector.dart   # Preset donation amount chips
└── services/
    ├── charity_service.dart         # Fetch charities from API
    └── donation_service.dart        # Submit and retrieve donations
```

---

## 🧩 Screen Overview

### `HomeScreen`

The landing screen. Shows the user's total giving summary card, category filter chips, and a scrollable list of charity cards. Each card displays the charity name, cause tag, short description, fundraising progress bar, and a suggested donation amount.

### `DetailScreen`

Opened by tapping a charity card. Shows the charity's full description, quick-select donation amounts ($5, $10, $25, $50), a live impact preview ("your $10 will..."), and a confirm donate button.

### `HistoryScreen`

A chronological log of all past donations, grouped by month. Each row shows the charity logo, name, cause category, date, amount, and completion status. Filterable by All, Monthly, and One-time.

### `ProfileScreen`

Displays the user's lifetime giving total, this month's total, donation count, and current streak. Also shows favourite cause tags and links to payment methods, reminders, tax receipts, and notification settings.

---

## 🎨 Design

The app uses a deep forest green (`#1B4332`) as its primary colour — conveying trust, growth, and purpose. Each cause category has a consistent colour identity carried across cards, tags, and the history view:

| Category | Colour |
|---|---|
| Education | Teal |
| Health | Coral |
| Environment | Green |
| Hunger | Amber |

---

## 🛠️ Roadmap

- [ ] Payment gateway integration (Stripe / M-Pesa)
- [ ] Recurring / monthly donation scheduling
- [ ] Push notifications for campaign milestones
- [ ] Shareable donation receipts
- [ ] Social giving — see what friends are supporting
- [ ] Dark mode support
- [ ] Charity search with full-text filtering

---

## 🤝 Contributing

Contributions are welcome! Please open an issue first to discuss what you'd like to change.

1. Fork the repo
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m 'Add my feature'`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request

---

## 📄 License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE) for details.

---

> Every tap counts. Built with ❤️ to make giving effortless. 🌍
- **Interactive SVG map** — tap any region directly on the map to select it
- **Region list picker** — bottom sheet with a scrollable list of all regions
- **Two-way sync** — selecting via map updates the text field, and vice versa
- **Lightweight** — powered by `flutter_svg`, no heavy map SDKs required



## 📸 Preview

> The map renders from a local SVG asset and highlights the selected region. A read-only text field below the map shows the currently selected region name and opens a bottom sheet picker on tap.



## 🚀 Getting Started

### Prerequisites

- Flutter SDK `>=3.0.0`
- Dart `>=3.0.0`

### Installation

1. **Clone the repository**

```bash
git clone https://github.com/your-username/tanzania-regions-flutter.git
cd tanzania-regions-flutter
```

2. **Install dependencies**

```bash
flutter pub get
```

3. **Add the SVG asset**

Place your `tanzania_map.svg` file inside the `assets/` folder, then register it in `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/tanzania_map.svg
```

4. **Run the app**

```bash
flutter run
```



## 📦 Dependencies

| Package | Version | Purpose |
|---|---|---|
| [`flutter_svg`](https://pub.dev/packages/flutter_svg) | `^2.0.0` | Renders the SVG map asset |

Add to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_svg: ^2.0.0
```



## 🗂️ Project Structure

```
lib/
├── main.dart                   # App entry point
└── tanzania_regions_page.dart  # Main widget file
    ├── TanzaniaRegionsPage         # Stateful root page
    ├── InteractiveTanzaniaMap      # SVG map renderer
    └── TanzaniaRegionsList         # Bottom sheet region picker

assets/
└── tanzania_map.svg            # Tanzania SVG map (you provide this)
```



## 🧩 Widget Overview

### `TanzaniaRegionsPage`

The root stateful widget. Manages `selectedRegion` state and coordinates updates between the map and the text field.

```dart
TanzaniaRegionsPage()
```

### `InteractiveTanzaniaMap`

Renders the SVG map. Receives the currently selected region code and a callback for when a region is tapped.

```dart
InteractiveTanzaniaMap(
  selectedRegion: 'TZ-01',
  onRegionSelected: (code) { /* handle selection */ },
)
```

| Property | Type | Description |
|---|---|---|
| `selectedRegion` | `String?` | ISO code of the currently selected region |
| `onRegionSelected` | `Function(String)` | Callback fired when a region is tapped |

### `TanzaniaRegionsList`

A `ListView`-based bottom sheet that lists all regions. Returns the selected region code via `Navigator.pop`.



## 🌍 Regions Data

Regions are stored as a `Map<String, String>` keyed by ISO 3166-2 code:

```dart
final Map<String, String> tanzaniaRegions = {
  'TZ-01': 'Arusha',
  'TZ-02': 'Dar es Salaam',
  'TZ-03': 'Dodoma',
  'TZ-04': 'Iringa',
  'TZ-05': 'Kagera',
  // ... add more regions
};
```

To add more regions, simply extend this map with the remaining Tanzania ISO codes.

<details>
<summary>Full list of Tanzania regions (31 total)</summary>

| Code | Region |
|---|---|
| TZ-01 | Arusha |
| TZ-02 | Dar es Salaam |
| TZ-03 | Dodoma |
| TZ-04 | Iringa |
| TZ-05 | Kagera |
| TZ-06 | Kaskazini Pemba |
| TZ-07 | Kaskazini Unguja |
| TZ-08 | Kigoma |
| TZ-09 | Kilimanjaro |
| TZ-10 | Kusini Pemba |
| TZ-11 | Kusini Unguja |
| TZ-12 | Lindi |
| TZ-13 | Manyara |
| TZ-14 | Mara |
| TZ-15 | Mbeya |
| TZ-16 | Mjini Magharibi |
| TZ-17 | Morogoro |
| TZ-18 | Mtwara |
| TZ-19 | Mwanza |
| TZ-20 | Pwani |
| TZ-21 | Rukwa |
| TZ-22 | Ruvuma |
| TZ-23 | Shinyanga |
| TZ-24 | Singida |
| TZ-25 | Tabora |
| TZ-26 | Tanga |
| TZ-27 | Geita |
| TZ-28 | Katavi |
| TZ-29 | Njombe |
| TZ-30 | Simiyu |
| TZ-31 | Songwe |

</details>

---

## 🛠️ Roadmap

- [ ] Highlight selected region on the SVG map
- [ ] Search/filter in the bottom sheet list
- [ ] Support for Zanzibar islands as separate selectable zones
- [ ] Animated region highlight transitions
- [ ] Return full region metadata (capital city, area, population)



## 🤝 Contributing

Contributions are welcome! Please open an issue first to discuss what you'd like to change.

1. Fork the repo
2. Create a feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m 'Add my feature'`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a Pull Request



## 📄 License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE) for details.

---

> Built with ❤️ for Tanzania 🇹🇿
