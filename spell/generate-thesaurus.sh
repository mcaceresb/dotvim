cat /usr/share/dict/american-english | while read p; do
    outputvar=`wordnet $p -synsn`
    if [ "$outputvar" = "" ]
    then
        echo $p, $outputvar
    else
        allsyns=`wordnet $p -synsn | xargs -d= | grep \> | tr "\\n" "," | sed 's/[=>]//g' | sed 's/\s+//g' | sed 's/INSTANCE OF//g' | sed 's/\,\s*/\,/g'`
        echo $p,$allsyns | sed 's/\,\s*/,/g' >> wafflesme
    fi
done 
