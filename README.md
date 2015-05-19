# ExaInsurance-WeatherWatch

## What is it?

A very simple JavaScript based application to do a search and display some results

## Quickstart

*To build and run:*

* Create the forests for the database

``http://[yourhostname]:8001/add-forest.xqy?``

**forest name:**    exainsurance-01

The remainder of the values can remain as the defaults, and press _OK_

* Create the database

``http://[yourhostname]:8001/add-database.xqy?section=database``

**database name:**  exainsurance

The remainder of the value can remain as the defaults and press _OK_

Now it is necessary to connect the forest to the database
Navigate to Configure -> Databases -> exainsurance -> Forests
Select your newly created forest from list and press _OK_

* Create the HTTP Service

``http://[yourhostname]:8001/add-http-servers.xqy?webDAV=false&section=group``

Created the HTTP service called exainsurance
server name:    exainsurance
root:           /
port:           8030
modules:        Modules
database:       exainsurance

The remainder of the values can stay as the defaults and press _OK_

This wil now start your HTTP/REST server

* Create an XDBC Server for loading data into the database with the mlcp command

xdbc server name:   exainsurance-xdbc
root:               /
port:               8029
modules:            Modules
database:           exainsurance

The remainder of the values can stay as defaults and press _OK_

* Create an XDBC Server for  the Module Database loading with the mlcp command

xdbc server name:   Modules-xdbc
root:               /
port:               8003
modules:            Modules
database:           Modules

The remainder of the values can stay as defaults and press _OK_

## Now we will try to get some data loaded into the database

Installation of the MarkLogic Content Pumpt (mlcp) is required for these data loading instructions

further details can be found at: http://docs.marklogic.com/guide/ingestion/content-pump#id_95434


Further attempt at a sample application in which to show the main functionality of MarkLogic 


&copy; Chris Day