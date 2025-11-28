#!/bin/bash
set -e

cd "$(dirname "$0")/.."

echo "=== Testing metadata.lua syntax ==="
lua -e "dofile('metadata.lua')"
echo "✓ metadata.lua is valid"

echo ""
echo "=== Testing hooks/available.lua syntax ==="
lua -e "dofile('hooks/available.lua')"
echo "✓ hooks/available.lua is valid"

echo ""
echo "=== Testing hooks/pre_install.lua syntax ==="
lua -e "dofile('hooks/pre_install.lua')"
echo "✓ hooks/pre_install.lua is valid"

echo ""
echo "=== Testing hooks/env_keys.lua syntax ==="
lua -e "dofile('hooks/env_keys.lua')"
echo "✓ hooks/env_keys.lua is valid"

echo ""
echo "=== All tests passed ==="
