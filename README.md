# 3D Image Modeller

A 3D solid modelling plugin for the [ART](https://www.cs.rhul.ac.uk/research/languages/csle/art.html) (Attribute Grammar Rewriting System) from Royal Holloway, University of London. Uses JavaFX to render interactive 3D scenes with boxes, camera controls, and mouse-based navigation.

## Features

- **3D box creation** — Define boxes with width, height, and depth
- **Interactive viewer** — Rotate, pan, and zoom the scene with the mouse
- **Axis indicators** — Red (X), green (Y), and blue (Z) axes for orientation
- **Term rewriting** — Extensible grammar and reduction rules in ART

## Prerequisites

- **Java** (JDK with `javac` and `java`)
- **JavaFX SDK** — The run script expects JavaFX at `/Users/ali/javafx/javafx-sdk-25.0.2/lib`
- **art.jar** — ART runtime library (must be in the project directory)

## Project Structure

```
3d_Image_Modeller/
├── ARTValuePlugin.java   # JavaFX plugin: 3D viewer, boxes, camera controls
├── Reduction.art         # ART grammar and term rewrite rules
├── runReduction.sh       # Compile and run script
└── art.jar               # ART runtime (not in repo)
```

## Running the Project

From the project directory:

```bash
./runReduction.sh
```

This will:

1. Compile `ARTValuePlugin.java` with JavaFX and `art.jar`
2. Run the ART system with `Reduction.art`, which initializes the 3D window and creates a sample box (20×10×40)

## Mouse Controls

| Action | Input |
|--------|--------|
| Rotate view | Left-click + drag |
| Pan | Right-click + drag |
| Zoom | Alt + left-click + drag |

## Customization

To create your own boxes, edit the `!try` line in `Reduction.art`:

```art
!try "plugin('init'); plugin('box', 20.0, 10.0, 40.0);"
```

Or use the `box` syntax:

```art
!try "plugin('init'); box 20.0, 10.0, 40.0;"
```

The parameters are width (X), height (Z), and depth (Y).

## JavaFX Path

If your JavaFX installation is elsewhere, update the paths in `runReduction.sh`:

```bash
--module-path /path/to/your/javafx-sdk/lib
```

## License

See the ART project for licensing of the underlying framework.
