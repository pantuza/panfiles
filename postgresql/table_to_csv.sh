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
    ${ECHO} -en "USAGE:\t${CMD} username server database table file";
}


#
# Prints error message and usage
#
error ()
{
    ${ECHO} -en "Missing $1 parameter";
    usage;
    exit 1;
}


# Script name
CMD=$0;

# system echo command path
ECHO=$(which echo);


# Postgres client tool
PSQL=$(which psql);



# Verifies arguments size
[ ! $# -gt 0 ] && {
    usage;
    exit 0;
}


# Get user name
[ ! -z "$1" ] && USER_NAME="$1" || error "username";


# Get server address/dns
[ ! -z "$2" ] && SERVER="$2" || error "server";


# Get database name
[ ! -z "$3" ] && DATABASE="$3" || error "database";


# Get table name
[ ! -z "$4" ] && TABLE="$4" || error "table";


# Get file name
[ ! -z "$5" ] && FILE="$5" || error "file";



#
# Exports table to csv file using psql command line tool
#
export_to_csv ()
{
    PSQL_CMD="\copy ${TABLE} to ${FILE} delimiter ',' csv header"

    echo "${PSQL} -U ${USER} -h ${SERVER} -d ${DATABASE} -c $PSQL_CMD;"
}


#
# MAIN EXECUTION
#
export_to_csv;
