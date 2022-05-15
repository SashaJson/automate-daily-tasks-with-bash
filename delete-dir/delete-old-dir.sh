#!/bin/bash #!/bin/bash

# wished time. older dirs will be deleted
time="2005-07-10 00:00"

reffile=wipeout.ref.$RANDOM
touch -d "$time" $reffile
echo
echo Deletes all dirs that are older than "$time"
echo
find . -type d -maxdeph 1 -path './*' ! -newer $reffile | while read dir; do
  echo rm -rf "$dir"
  rm -rf "$dir"
done
rm -f $reffile
