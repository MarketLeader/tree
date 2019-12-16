#!/bin/bash

# Run browserify
# https://github.com/babel/babelify#options
# https://github.com/browserify/browserify-handbook#configuring-transforms
browserify editor.js -t brfs > build.js

# Resolving: Error/Warning
REPLACE='return null'
FIND='throw new TypeError("\Int cannot represent non-integer value: ".concat((0, _inspect.default)(value)))'
sed -i "s|$FIND|$REPLACE|g" build.js

FIND="warning\$1(false, 'Encountered two children with the same key"
REPLACE="// warning\$1(false, 'Encountered two children with the same key"
sed -i "s|$FIND|$REPLACE|g" build.js

FIND="warning\$1(false, 'Invalid aria prop"
REPLACE="// warning\$1(false, 'Invalid aria prop"
sed -i "s|$FIND|$REPLACE|g" build.js
