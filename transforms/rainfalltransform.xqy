xquery version "1.0-ml";
module namespace example = "http://marklogic.com/example";
(: If the input document is XML, insert @NEWATTR, with the value
 : specified in the input parameter. If the input document is not
 : XML, leave it as-is.
 :)
declare function example:transform(
        $content as map:map,
        $context as map:map
) as map:map*
{
    let $attr-value :=
        (map:get($context, "transform_param"), "UNDEFINED")[1]
    let $the-doc := map:get($content, "value")
    return
        if (fn:empty($the-doc/element()))
        then $content
        else
            let $doc := $the-doc/*
            return (
                map:put($content, "value",
                        document {
                            $doc/preceding-sibling::node( ),
                            element {name($doc)}{
                                $doc/@*,
                                $doc/Product_code[1],
                                element{"Station_number"}{
                                    $doc/Bureau_of_Meteorology_station_number[1]/text()
                                },
                                let $stationid := $doc/Bureau_of_Meteorology_station_number[1]/text()
                                let $datestr := fn:concat($doc/Day[1],"-",$doc/Month[1]/text(),"-",$doc/Year[1]/text())
                                return(
                                    map:put($content, "uri", fn:concat("/readings/rainfall/",$stationid,"-",$datestr,".xml"))
                                ),
                                $doc/Year[1],
                                $doc/Month[1],
                                $doc/Day[1],
                                element{"Date"} {
                                    fn:concat($doc/Day[1],"-",$doc/Month[1]/text(),"-",$doc/Year[1]/text())
                                },
                                $doc/Rainfall_amount__millimetres_[1],
                                $doc/Period_over_which_rainfall_was_measured__days_[1],
                                $doc/Quality[1]

                            },
                            $doc/following-sibling::node()
                        }

                ), $content

            )
};