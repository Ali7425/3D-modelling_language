#!/bin/bash
# runAttribute.sh — Attribute-action build + run script (JavaFX-enabled)
set -euo pipefail

JFX="/Users/ali/javafx/javafx-sdk-25.0.2/lib"
MODS="javafx.controls,javafx.graphics"
CP=".:art.jar"

echo "== Compiling ARTValuePlugin.java =="
javac --module-path "$JFX" --add-modules $MODS -cp "$CP" ARTValuePlugin.java

echo "== Generating ARTGeneratedActions.java from Attribute.art =="
# IMPORTANT: no 'fx' here, otherwise ART stays running and the script never continues
java -Dprism.forceGPU=true \
  --module-path "$JFX" --add-modules $MODS \
  -cp "$CP" uk.ac.rhul.cs.csle.art.ART Attribute.art !generate actions

echo "== Compiling ARTGeneratedActions.java =="
javac --module-path "$JFX" --add-modules $MODS -cp "$CP" ARTGeneratedActions.java

echo "== Running Attribute-action interpreter =="
# If you want the 3D JavaFX window, keep 'fx' here. If you want headless, delete 'fx'.
java -Dprism.forceGPU=true \
  --module-path "$JFX" --add-modules $MODS \
  -cp "$CP" uk.ac.rhul.cs.csle.art.ART fx !interpreter attributeAction Attribute.art