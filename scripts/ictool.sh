#!/bin/bash
# Icon Composer ictool: help + version only. PUBLIC repo lane — no private samples, no app icon exports here.
# Runs on macos-26 with APP (mounted Icon Composer.app) and OUT (artifact dir) set.
set -u
ICT="$APP/Contents/Executables/ictool"
ICR="$APP/Contents/Executables/icrtool"
echo "== ictool: $ICT"; file "$ICT"; lipo -info "$ICT"
echo "== ictool --help";    "$ICT" --help    > "$OUT/ictool-help.txt" 2>&1; echo "exit=$?" >> "$OUT/ictool-help.txt"; cat "$OUT/ictool-help.txt"
echo "== ictool --version"; "$ICT" --version > "$OUT/ictool-version.txt" 2>&1; echo "exit=$?" >> "$OUT/ictool-version.txt"; cat "$OUT/ictool-version.txt"
echo "== icrtool --help";   "$ICR" --help    > "$OUT/icrtool-help.txt" 2>&1; echo "exit=$?" >> "$OUT/icrtool-help.txt"; cat "$OUT/icrtool-help.txt"
echo "== icrtool --version"; "$ICR" --version > "$OUT/icrtool-version.txt" 2>&1; echo "exit=$?" >> "$OUT/icrtool-version.txt"; cat "$OUT/icrtool-version.txt"
exit 0
