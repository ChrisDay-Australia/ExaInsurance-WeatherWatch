#!/usr/bin/env bash
hname=$1
echo $hname

echo "make sure that you set the PATH environment variable for mlcp before running this command"
echo "loading all the transforms"
echo "now loading the RAINFALL DATA TRANSFORM"
echo "===================================="
mlcp.sh IMPORT -host $hname -port 8003 -username Admin -password 8milk@crab -input_file_path ../transforms/rainfalltransform.xqy -mode local -document_type MIXED -output_uri_replace "/Users/chris/WebstormProjects/ExaInsurance-WeatherWatch,''"
