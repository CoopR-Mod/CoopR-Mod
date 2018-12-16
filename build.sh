#!/bin/sh

ARMAKE="tools/armake";
VALIDATOR="tools/sqf_validator.py";
DEST="@CoopR/addons"

python $VALIDATOR

rm -rf @CoopR
mkdir -p $DEST

$ARMAKE build -p -f addons/persistence $DEST/character.pbo
$ARMAKE build -p -f addons/core $DEST/core.pbo
$ARMAKE build -p -f addons/death $DEST/death.pbo
$ARMAKE build -p -f addons/equipment $DEST/equipment.pbo
$ARMAKE build -p -f addons/eventhandler $DEST/eventhandler.pbo
$ARMAKE build -p -f addons/integration $DEST/integration.pbo
$ARMAKE build -p -f addons/intel $DEST/intel.pbo
$ARMAKE build -p -f addons/lobby $DEST/lobby.pbo
$ARMAKE build -p -f addons/reputation $DEST/reputation.pbo
$ARMAKE build -p -f addons/supply $DEST/supply.pbo

cp mod.cpp @CoopR/mod.cpp
