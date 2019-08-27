#!/bin/sh

ARMAKE="tools/armake";
VALIDATOR="tools/sqf_validator.py";
DEST="@CoopR/addons"
KEYS="@CoopR/keys"

python $VALIDATOR

rm -rf @CoopR
mkdir -p $DEST
mkdir -p $KEYS

$ARMAKE build -p -f addons/persistence $DEST/persistence.pbo
$ARMAKE build -p -f addons/core $DEST/core.pbo
$ARMAKE build -p -f addons/armory $DEST/armory.pbo
$ARMAKE build -p -f addons/integration $DEST/integration.pbo
$ARMAKE build -p -f addons/intelligence $DEST/intelligence.pbo
$ARMAKE build -p -f addons/lobby $DEST/lobby.pbo
$ARMAKE build -p -f addons/supply $DEST/supply.pbo
$ARMAKE build -p -f addons/missions $DEST/missions.pbo
$ARMAKE build -p -f addons/campsite $DEST/campsite.pbo

cp mod.cpp @CoopR/mod.cpp
cp keys\* @CoopR\keys\
