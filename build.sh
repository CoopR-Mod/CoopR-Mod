#!/bin/sh

ARMAKE="tools/armake";
VALIDATOR="tools/sqf_validator.py";
DEST="@CoopR/addons"

python $VALIDATOR

rm -rf @CoopR
mkdir -p $DEST

$ARMAKE build -p -f addons/persistence $DEST/persistence.pbo
$ARMAKE build -p -f addons/core $DEST/core.pbo
$ARMAKE build -p -f addons/armory $DEST/armory.pbo
$ARMAKE build -p -f addons/integration $DEST/integration.pbo
$ARMAKE build -p -f addons/intelligence $DEST/intelligence.pbo
$ARMAKE build -p -f addons/lobby $DEST/lobby.pbo
$ARMAKE build -p -f addons/supply $DEST/supply.pbo

cp mod.cpp @CoopR/mod.cpp
