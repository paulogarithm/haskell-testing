# Get the tests directory
BASEDIR=$(dirname "$0")
HERE="$PWD/$BASEDIR"

# Get the tmp file
TMPFILE=/tmp/__cabaltmpfile.tmp

# Run the tests
cd "$HERE"; cabal test 1>"$TMPFILE" 2>/dev/null
wait

# Read the file and get the line
NEXT=0
INC=0
while read line; do
    # echo $line "HAHA"
    if [[ $line = "Test suite logged to:" ]];
    then
        ((NEXT=1))
        continue
    elif [[ $NEXT = 1 ]];
    then
        # Get the line and reset next
        _file=$line;

        # Increment and display backspace
        ((INC=INC+1))
        if [[ $INC != 1 ]];
        then
            echo;
        fi

        # Get the test directory
        _lines=$(wc -l $_file)
        _lines="${_lines%% *}"
        echo "[ Testing ]"

        # Display all lines in file
        INCC=0
        ((_lines=_lines-1))
        while read lline; do
            if [[ $INCC != 0 ]] && [[ $INCC != $_lines ]];
            then
                res=$(echo $lline | sed "s/FAIL/f/");
                echo $res
            fi
            ((INCC=INCC+1))
        done < $_file
        wait;
        # awk -v my_var="$LINES" '{ if (NR != 1 && NR != my_var) {print $0} }' $FILE
    fi
    ((NEXT=0))
done < $TMPFILE

# Remove tmp
wait
rm $TMPFILE