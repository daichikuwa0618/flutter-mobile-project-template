#!/usr/bin/env bash

files=()
while IFS= read -r -d $'\0' file; do
    files+=("$file")
done < <(find . -name "*.dart" -not \( -path "*/gen/*/*.dart" -o -name "*.freezed.dart" -o -name "*.g.dart" -o -name "*.gen.dart" \) -print0)

dart format -o none  --set-exit-if-changed "${files[@]}"
