#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR/..

NEW_VERSION="${1}"

echo "Bumping version: ${NEW_VERSION}"

for pkg in {tinkoff_acquiring,tinkoff_acquiring_flutter}; do
  # Bump version in pubspec.yaml
  perl -pi -e "s/^version: .*/version: $NEW_VERSION/" packages/$pkg/pubspec.yaml
done

perl -pi -e "s/tinkoff_acquiring: .*/tinkoff_acquiring: ^$NEW_VERSION/" packages/tinkoff_acquiring_flutter/pubspec.yaml
perl -pi -e "s/tinkoff_acquiring: .*/tinkoff_acquiring: ^$NEW_VERSION/" example/pubspec.yaml
perl -pi -e "s/tinkoff_acquiring_flutter: .*/tinkoff_acquiring_flutter: ^$NEW_VERSION/" example/pubspec.yaml
perl -pi -e "s/tinkoff_acquiring: .*/tinkoff_acquiring: ^$NEW_VERSION/"  packages/tinkoff_acquiring/README.md
perl -pi -e "s/tinkoff_acquiring: .*/tinkoff_acquiring: ^$NEW_VERSION/"  packages/tinkoff_acquiring/README.ru.md
perl -pi -e "s/tinkoff_acquiring_flutter: .*/tinkoff_acquiring_flutter: ^$NEW_VERSION/"  packages/tinkoff_acquiring/README.md
perl -pi -e "s/tinkoff_acquiring_flutter: .*/tinkoff_acquiring_flutter: ^$NEW_VERSION/"  packages/tinkoff_acquiring/README.ru.md