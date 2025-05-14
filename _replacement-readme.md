# Gutenberg (built verson)

This is a duplicate of the [WordPress/Gutenberg](https://github.com/WordPress/gutenberg) repository containing a built version of the plugin.

You are currently viewing the version build from the source:

* Branch: https://github.com/WordPress/gutenberg/tree/%%BRANCH%%
* Commit: https://github.com/WordPress/gutenberg/commit/%%COMMIT%%

## Pupose

The purpose of this repository is to allow developers to run `git bisect` without the need to re-install NPM packages and build the repository on each checkout. The source commit is included in the commit messages of this repository.

The process becomes:

1. Clone this repository to a WordPress install's plugins directory
2. Activate the plugin
3. Run `git bisect` following the instructions in the [git bisect documentation](https://git-scm.com/docs/git-bisect). The documentation includes some examples.
4. Once you find the commit in which the bug was introduced, review the commit message for the original commit in the Gutenberg repository.

## Contents of this repository

This repository contains built versions of Gutenberg from June 13, 2024 onwards. It includes:

* `trunk` -- from the source commit https://github.com/WordPress/gutenberg/commit/91084bf913e14e37331fc87dbc5565aa4113b34d onwards
* Gutenberg plugin release branches from Gutenberg 18.6 upwards
* WordPress release branchses from WordPress 6.7 upwards

## Pull requests and issues must be reported upstream

No pull requests or issues will be accepted in this repository.

As a duplicate of the source Gutenberg repository, issues and pull requests should be logged at the source:

* [Gutenberg Issue Tracker](https://github.com/WordPress/gutenberg/issues)
* [Gutenberg Pull Requests](https://github.com/WordPress/gutenberg/pulls)

Please review the [upstream contribution guide](https://github.com/WordPress/gutenberg/blob/trunk/CONTRIBUTING.md) for further details on contributing to Gutenberg.

For bugs and enhancement requests in WordPress Core, please visit the [WordPress-Develop issue tracker](https://core.trac.wordpress.org/).
