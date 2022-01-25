#!/bin/sh

# Switch to the frontend directory.
cd /code/frontend

# Perform a global gulp installation and a dependency install if needed.
if [ ! -d node_modules ]; then
    echo "Installing Node.js modules..."
    yarn global add gulp-cli || exit 1
    yarn install || exit 1
    echo "Node.js module install complete"
fi

# Run gulp. We use exec to replace the shell process so that gulp receives
# termination signals.
exec gulp
