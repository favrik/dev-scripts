sudo ./mksite
======

`sudo ./mksite` is a command-line program that pretends to automate the *local* setup
of a web development project.

It makes a bunch of assumptions, so this will probably only work on
Linux-like environments.

Detailed help is provided by the `sudo ./mksite -h` command.  Here's the
output:

    Usage: sudo ./mksite [-p SKELETON] SITE_NAME [OPTION]

    SITE_NAME can be almost anything (any valid URL character)
    and it will be used as the hostname.

    By default 'mksite' creates SITE_NAME:

      - VHOST configuration (v)
      - directory (d)
      - database (b)
      - git repository (g)
      - initial .gitignore file
      - entry in /etc/hosts (h)

    So it needs 'sudo' for some of the tasks. The letters in
    parenthesis can be used as an abbreviation when excluding
    actions; the .gitignore is always created if creating the
    repo.

    Examples:

      # Creates everything
      sudo ./mksite example.com

      # Creates everything but database, git repository, and .gitignore
      sudo ./mksite example.com no-bgi

      # Creates everything; additionally, initializes the project with a
      # CodeIgniter application skeleton
      sudo ./mksite -p ci example.com

The script can be customized by simply changing the variables defined
at the top of the file according to your custom environment.  However,
there are things that may not apply, like creating a gitolite repository
every time a new site is setup.
