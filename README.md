# Examples demonstrating the `ceylon war` command

There are currently two modules here: `servlet.example` and
`jaxrs.example`. You need to build Ceylon from source using my forks of
[ceylon-compiler](https://github.com/tobias/ceylon-compiler/tree/war-tool)
and [ceylon-sdk](https://github.com/tobias/ceylon-sdk/tree/war-module)
in order to build and run WAR files for them.

Once you've built Ceylon, compile:

    ceylon compile

Then generate a war file:

    ceylon war servlet.example

or

    ceylon war jaxrs.example


Run `ceylon help war` for a full list of options.

The resulting WAR files both work in WildFly 8.1.0.Final
and 9.0.0.Alpha1, and the servlet.example WAR works in Tomcat as well
(but not yet Jetty). The jaxrs.example WAR hasn't yet been tried in
any other EE containers.
