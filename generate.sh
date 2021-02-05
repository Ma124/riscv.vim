#!/bin/sh

awk -f - "$1"/opcodes-rv* << 'EOF' | fold -s -b | awk 'BEGIN { ORS="" } $0 !~ /^(#|$)/ { print "syntax keyword riscvInstruction " } { sub(/ $/, "", $0); print $0 "\n" }' | tr '#' '"'
    BEGIN {
        ORS=""
        isFirst=1
    }

    FNR == 1 {
        sub(/^.*opcodes-/, "# ", FILENAME)
        print "\n\n" toupper(FILENAME) "\n"
        isFirst=1
    }

    $1 ~ /^(#|$)/ {
        next
    }

    !isFirst {
        print " "
    }

    {
        isFirst=0
        sub(/^ /, "", $1)
        print "\"" $1 "\""
    }
EOF

