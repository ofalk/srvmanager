srvmanager (aka SM, aka ServerManager)
======================================

The new Mojolicious based server manager - still a long way to go...

Intention / Idea
================

An easy to use, fast, scalable CMDB for small and medium companies.
It should be fun to use the interface, instead of a pain like we know it from
eg. Remedy and other similar enterprise software.

When I started to work for a large company in 2011, I got presented with a similar
project - only in use by the UNIX/Linux team. And some Remedy CMDB installation.
The obvious issues:
* buggy, old, slow PHP code
* Lots of unused code
* No sync between the srvmanager and CMDB
* Monitoring wasn't connected to any of the tools

Therefore I wanted to create a new, fresh, state of the art interface. The things
that have been coded meantime (not part of this project) around the old database:
* srvmanager <-> CMDB sync (should be easily portable to the new version)
* Template::Toolkit based automatic Nagios configuration - data from srvmanager

My world is UNIX/Linux systems engineering, therefore I've started already several
times to create a new web interface. Yes, you got it, (web) frontend development
isn't really my home base. Anyway. This time it seems I got the right tools:
* Mojolicious
* Template::Toolkit
* DBIx::Class
* Twitter Bootstrap
* JQuery

TODO
====

* Lots of frontend code needs to be written. :-)
* Lots of backend code needs to be written. :-)

* Decision about authentication and how that could fit with the idea about
  multi client capability. Currently there's a test Facebook authentication, but
  we'll probably also want Github, Twitter, local Database (MySQL), ???
  
* Decision if we want a shared, public version available. If so, we'll probably not
  only need multi client capability, but also groups. When talking about groups the
  next thing that comes to my mind are permissions. (1)


State
=====

* Basic layout has already been created.
* Backend and Frontend code for 'CatDomain' has been fully implemented to show how it
  could work.


License
=======

The project will probably be licensed under some GPL or Artistic.


Notes
=========
1) A possible "workflow":
   *) User X creates account
   *) User X create company 'SomeCorp'

   *) User X creates group 'Admins' (all rights)
   *) User X adds user user1@somecorp.com to Admins
    *) SM sends mail to user1@somecorp.com
    *) user1@somecorp.com goes to SM website and wants to use his Facebook account for login
   *) User X adds user user2@somecorp.com to Admins
    *) SM sends mail to user2@somecorp.com
    *) user2@somecorp.com goes to SM website and wants to use his Twitter account for login

   *) User X creates group 'Operators' (read only)
   *) User X adss user op1@somecorp.com
    *) SM sends mail to op1@somecorp.com
    *) op1@somecorp.com wants to use his mail address for login (local database)
...
TO BE CONTINUED
...
