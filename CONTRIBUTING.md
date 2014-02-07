Contributing to the Mesos Cookbook
====================================
The Mesos cookbook uses GitHub to triage, manage, and track issues and pull requests to the cookbook. GitHub has excellent documentation on how to [fork a repository and start contributing](https://help.github.com/articles/fork-a-repo.).

All contributors are welcome to submit patches, but we ask you keep the following guidelines in mind:

- [Coding Standards](#coding-standards)
- [Testing](#testing)
- [Prerequisites](#prerequisites)

If you're looking to contribute but aren't sure where to start, check out the open issues.


Coding Standards
----------------
The submitted code should be compatible with the standard Ruby coding guidelines. Here are some additional resources:

- [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide)
- [GitHub Styleguide](https://github.com/styleguide/ruby)

This cookbook is equipped with Rubocop, which will fail the build for violating these standards.


Testing
-------
Whether your pull request is a bug fix or introduces new classes or methods to the project, we kindly ask that you include tests for your changes. Even if it's just a small improvement, a test is necessary to ensure the bug is never re-introduced.

We understand that not all users are familiar with the testing ecosystem. This cookbook is fully-tested using [Foodcritic](https://github.com/acrmp/foodcritic), [Rubocop](https://github.com/bbatsov/rubocop), and [Test Kitchen](https://github.com/test-kitchen/test-kitchen) with [Serverspec](https://github.com/serverspec/serverspec) bussers.


Prerequisites
-------------
Developing this cookbook requires a sane Ruby 1.9+ environment with `bundler` installed. In order to run the Test Kitchen integration suite, you must also have Vagrant and VirtualBox installed:

- [Vagrant](https://vagrantup.com)
- [VirtualBox](https://virtualbox.org)


Process
-------
1. Clone the git repository from GitHub:

        $ git clone git@github.com:mdsol/mesos_cookbook.git

2. Install the dependencies using bundler:

        $ bundle install

3. Create a branch for your changes:

        $ git checkout -b my_bug_fix

4. Make any changes
5. Write tests to support those changes.
6. Run the tests:

        $ bundle exec rake

7. Assuming the tests pass, open a Pull Request on GitHub


Do's and Don't's
----------------
- **Do** include tests for your contribution
- **Do NOT** break existing behavior (unless intentional)
- **Do NOT** modify the version number in the `metadata.rb`
- **Do NOT** modify the CHANGELOG
