#!/usr/bin/env bash
set -euo pipefail

echo "=== OCLM environment check ==="
echo "Date: $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "Machine: $(uname -m)"
echo "macOS: $(sw_vers -productVersion 2>/dev/null || echo unknown)"
echo

for cmd in brew git python3; do
  if command -v "$cmd" >/dev/null 2>&1; then
    echo "[OK] $cmd: $(command -v "$cmd")"
  else
    echo "[MISSING] $cmd"
  fi
done

if command -v tamarin-prover >/dev/null 2>&1; then
  echo "[OK] tamarin-prover:"
  tamarin-prover --version || true
else
  echo "[NOT INSTALLED] tamarin-prover"
fi

if command -v maude >/dev/null 2>&1; then
  echo "[OK] maude:"
  maude --version 2>&1 | head -n 2 || true
else
  echo "[NOT INSTALLED] maude"
fi

if command -v dot >/dev/null 2>&1; then
  echo "[OK] graphviz:"
  dot -V 2>&1 || true
else
  echo "[NOT INSTALLED] graphviz"
fi
