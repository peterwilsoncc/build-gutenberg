# Create a built version of the Gutenberg plugin.

Used for creating the repo https://github.com/peterwilsoncc/gutenberg-build/, a built version of the WordPress Gutenberg repository.

This is helpful when running `git bisect` as it avoids the need for developers to run `nvn use; npm ci; npm run build;` in order to determine whether the commit is good or bad.
