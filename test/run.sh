#!/bin/bash
set -e

cd "$(dirname "$0")/.."

# Use luajit if lua not available
LUA=${LUA:-$(command -v lua || command -v luajit || echo "lua")}

# Setup mock globals for vfox
SETUP="PLUGIN = {}; RUNTIME = {osType='linux', archType='amd64'}"

echo "=== Testing metadata.lua syntax ==="
$LUA -e "dofile('metadata.lua')"
echo "✓ metadata.lua is valid"

echo ""
echo "=== Testing hooks/available.lua syntax ==="
$LUA -e "$SETUP; dofile('hooks/available.lua')"
echo "✓ hooks/available.lua is valid"

echo ""
echo "=== Testing hooks/pre_install.lua syntax ==="
$LUA -e "$SETUP; dofile('hooks/pre_install.lua')"
echo "✓ hooks/pre_install.lua is valid"

echo ""
echo "=== Testing hooks/post_install.lua syntax ==="
$LUA -e "$SETUP; dofile('hooks/post_install.lua')"
echo "✓ hooks/post_install.lua is valid"

echo ""
echo "=== Testing hooks/env_keys.lua syntax ==="
$LUA -e "$SETUP; dofile('hooks/env_keys.lua')"
echo "✓ hooks/env_keys.lua is valid"

echo ""
echo "=== All tests passed ==="
