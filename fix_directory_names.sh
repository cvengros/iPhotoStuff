#!/usr/bin/env bash

# for each subdirectory
for WEIRD_DATE in *; do
  if [ -d "$WEIRD_DATE" ]; then
    # try converting to a better date
    BETTER_DATE=`date -jf "%B %d, %Y" "${WEIRD_DATE}" '+%Y-%m-%d' 2> /dev/null`
    if [ $? -ne 0 ]; then
      # convert didn't work
      echo "Skipping $WEIRD_DATE"
      continue
    fi

    if [ -d "$BETTER_DATE" ]; then
      echo "$BETTER_DATE already exists, skipping $WEIRD_DATE"
      continue
    fi

    # converting successful and directory doesn't exist, so rename it
    echo "Renaming $WEIRD_DATE to $BETTER_DATE"
    mv "$WEIRD_DATE" "$BETTER_DATE"
  fi
done