#!/bin/sh
javac                      --module-path /Users/ali/javafx/javafx-sdk-25.0.2/lib --add-modules javafx.controls -cp .:art.jar ARTValuePlugin.java
java -Dprism.forceGPU=true --module-path /Users/ali/javafx/javafx-sdk-25.0.2/lib --add-modules javafx.controls -cp .:art.jar uk.ac.rhul.cs.csle.art.ART fx Reduction.art
