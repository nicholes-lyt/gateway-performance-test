#!/usr/bin/env bash

CurrentDir=$(dirname $0)

find $CurrentDir -name "build" | xargs rm -rf                                                                                                                                 [±develop ●●●]
$CurrentDir/gradlew clean  build

