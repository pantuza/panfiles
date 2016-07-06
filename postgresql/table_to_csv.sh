#!/bin/bash

#
# Script to export a table data to CSV file
#
# Author: Gustavo Pantuza
# Since: 05.07.2016
#


#
# Prints usage message
#
usage ()
{
    ${ECHO} -en "USAGE:\t${CMD} username server database table";
}


#
# Prints error message and usage
#
error ()
{
    # TODO: prints $1 and then usage with exit 1
}


CMD=$0;

ECHO=$(which echo);


# Postgres client tool
PSQL=$(which psql);


# Get user name
[ ! -z "$1" ] && USER_NAME="$1" || usage;


# Get server address/dns
[ ! -z "$2" ] && SERVER="$2" || usage;


# Get database name
[ ! -z "$3" ] && DATABASE="$3" || usage;


# Get table name
[ ! -z "$4" ] && TABLE="$4" || usage;


# Get file name
[ ! -z "$5" ] && FILE="$5" || usage;


export_to_csv ()
{
    PSQL_CMD = "\copy ${TABLE} to ${FILE} delimiter ',' csv header"

    ${PSQL} -U ${USER} -h ${SERVER} -d ${DATABASE} -c $PSQL_CMD;
}


#
# MAIN EXECUTION
#
export_to_csv;
