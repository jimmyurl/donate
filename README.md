# 🗺️ Tanzania Regions — Flutter Map Picker

An interactive Flutter widget that lets users explore and select Tanzania's regions via a tap-on-map or scrollable list interface.



## ✨ Features

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
