# How to contribute

PROJECT is Apache 2.0 licensed and accepts contributions via GitHub pull
requests. This document outlines some of the conventions on commit message
formatting, contact points for developers and other resources to make getting
your contribution into PROJECT easier.

# Email and chat

- Email: [giantswarm](https://groups.google.com/forum/#!forum/giantswarm)
- IRC: #[giantswarm](irc://irc.freenode.org:6667/#giantswarm) IRC channel on
  freenode.org

## Getting started

- Fork the repository on GitHub
- Read the [README](README.md) for build instructions

## Reporting Bugs and Creating Issues

Reporting bugs is one of the best ways to contribute. If you find bugs or
documentation mistakes in the PROJECT project, please let us know by [opening an
issue](https://github.com/giantswarm/PROJECT/issues/new). We treat bugs and
mistakes very seriously and believe no issue is too small. Before creating a bug
report, please check there that one does not already exist.

To make your bug report accurate and easy to understand, please try to create
bug reports that are:

- Specific. Include as much details as possible: which version, what
  environment, what configuration, etc. You can also attach logs.

- Reproducible. Include the steps to reproduce the problem. We understand some
  issues might be hard to reproduce, please includes the steps that might lead
  to the problem. If applicable, you can also attach affected data dir(s) and a
  stack trace to the bug report.

- Isolated. Please try to isolate and reproduce the bug with minimum
  dependencies. It would significantly slow down the speed to fix a bug if too
  many dependencies are involved in a bug report. Debugging external systems
  that rely on PROJECT is out of scope, but we are happy to point you in the
  right direction or help you interact with PROJECT in the correct manner.

- Unique. Do not duplicate existing bug reports.

- Scoped. One bug per report. Do not follow up with another bug inside one
  report.

You might also want to read [Elika Etemad’s article on filing good bug
reports](http://fantasai.inkedblade.net/style/talks/filing-good-bugs/) before
creating a bug report.

We might ask you for further information to locate a bug. A duplicated bug
report will be closed.

## Contribution flow

This is a rough outline of what a contributor's workflow looks like:

- Create a feature branch from where you want to base your work. This is usually
  master.
- Make commits of logical units.
- Make sure your commit messages are in the proper format (see below).
- Push your changes to a topic branch in your fork of the repository.
- Submit a pull request to giantswarm/PROJECT.
- Adding unit tests will greatly improve the chance for getting a quick review
  and your PR accepted.
- Your PR must receive a LGTM from project owners.
- When PR gets approval, all commits are squashed into one and merged by one of
  the owners.

Thanks for your contributions!

### Code style

The coding style suggested by the Golang community is used. See the [style
doc](https://github.com/golang/go/wiki/CodeReviewComments) for details.

Please follow this style to make the code easy to review, maintain, and develop.

### Format of the Commit Message

We follow a rough convention for commit messages that is designed to answer two
questions: what changed and why. The subject line should feature the what and
the body of the commit should describe the why.