# HDI_ORDA_Current_Selection

> **How do I use current selected records with entity selections in ORDA?**
> A 4D "How Do I" (HDI) example showing how to move back and forth between the classic **current selection** and ORDA **entity selections**.

| | |
|---|---|
| **Category** | ORDA / Data access |
| **Minimum 4D version** | 4D v17 (original) -- this project is saved for 4D 21 (`compatibilityVersion` 2101) |
| **License** | MIT |

## Overview

Classic 4D code works on the *current selection* of a table; ORDA works on *entity selections*. Most real applications need both at once. This example uses a small `Pupil` table (first name, last name, language) and a three-tab form to show how to keep the two worlds in sync, side by side:

| Tab | What it shows |
|-----|---------------|
| 1 | Introduction to the technique |
| 2 | *Update current selection* -- `USE ENTITY SELECTION` pushes an entity selection into the current selection of `[Pupil]` |
| 3 | *Update entity selection* -- `Create entity selection` builds an entity selection from the current selection |

(Tab titles and descriptions are read from the `[INFO]` table at runtime.)

Tabs 2 and 3 display an **entity selection** list box and a **records selection** list box next to each other, so you can see both representations change as you click.

## Features

- Build an entity selection from the current selection: `Create entity selection([Pupil])`
- Replace the current selection with an entity selection: `USE ENTITY SELECTION(Form.pupils)`
- Query with ORDA (`ds.Pupil.query("language=:1"; ...)`) and with the classic `QUERY` dialog, and compare the results
- Bind a list box to a collection/entity selection (`Form.pupils`) and another to the current selection of a table
- Display the same data through a subform list form (`PupilsListe`)
- A **Trace** check box that calls `TRACE` before each action, so you can step through the code

## Points of interest

- **Startup**: `onStartup` calls `00_Start`, which imports `Resources/<dataclass>.4ie` into any empty dataclass, then opens the splash dialog through `CALL WORKER` with a non-blocking `DIALOG(...; *)`. Re-running it focuses the existing window instead of opening a second one.
- **State lives in `Form`**: the splash options (title, blog URL, minimum version, license) are passed to the form as an object; the "Demo" button hands the same `Form` object on to the main form.
- **Version / license gate**: the splash form checks `Form.minimumVersion` and `Form.license` and, if they are not met, shows an overlay and turns the button into **Close**.
- **Dark mode**: `styleSheets.css` uses `prefers-color-scheme` media queries and the `automatic` / `automaticAlternate` colour values.
- **Liquid Glass**: `styleSheets_mac.css` sizes push buttons for `form-theme: liquid-glass` (27 px) and `mac-classic` (23 px).
- **Localisation**: all UI strings come from XLIFF (`Resources/en.lproj`, `Resources/ja.lproj`) via `:xliff:` references and `Localized string`.

## Getting started

1. Open `Project/HDI_ORDA_Current_Selection.4DProject` with 4D 21 or later (4D, or 4D Server in interpreted mode).
2. The *Demo* menu item (or the startup method) opens the example. Default data is imported automatically on first run.

## Project layout

```
Project/
  HDI_ORDA_Current_Selection.4DProject
  Sources/
    Methods/            00_Start (entry point), initPages, RW, Compiler_*
    Forms/HDI/          splash dialog
    Forms/HDI2/         main demo form (tabs, list boxes)
    TableForms/         input/output/list forms for [INFO] and [Pupil]
    menus.json          menu bar (standard actions)
    styleSheets*.css    dark mode and platform themes
Resources/
  en.lproj, ja.lproj    XLIFF localisation
  Images/               background and button pictures
  *.4ie / *.4si         default data (import export / structure)
```

## Modernisation notes

Converted from the v17 binary database with 4D 21's project conversion, then updated to current conventions: `var` / `#DECLARE` instead of `C_*`, standard menu actions instead of wrapper methods, invisible subroutines, XLIFF localisation, dark mode and Liquid Glass styling, and list box defaults (`truncateMode: none`, `resizingMode: legacy`). Cleanup rules are documented in [`.github/instructions`](.github/instructions).

## References

- Blog post: https://blog.4d.com/going-back-and-forth-between-current-selection-to-orda/
- Original download (4D v17): https://download.4d.com/Demos/4D_v17/HDI_ORDA_Current_Selection.zip
- ORDA: https://developer.4d.com/docs/ORDA/overview
- Entity selections: https://developer.4d.com/docs/ORDA/entities
- CSS in 4D: https://developer.4d.com/docs/FormEditor/stylesheets
- Localisation (XLIFF): https://developer.4d.com/docs/Project/localization

## License

[MIT](LICENSE)
