#!/usr/bin/env bash

# preprocess the super-weird, like Třeboň, South Bohemia - Valy, August 2, 2018
# dt=`echo "$WEIRD_DATE" | grep -o '[A-Za-z]\+ [0-9]\+, [0-9]\{4\}$'`


DIR=${1:-`dirname $0`}

echo "$DIR"
# for each subdirectory
for SUBDIR in "$DIR"/*/; do
  WEIRD_DATE=`basename "$SUBDIR"`
  if [ -d "$SUBDIR" ]; then
    # try converting to a better date
    BETTER_DATE=`date -jf "%B %d, %Y" "${WEIRD_DATE}" '+%Y-%m-%d' 2> /dev/null`
    if [ $? -ne 0 ]; then
      # convert didn't work
      echo "Skipping $WEIRD_DATE"
      continue
    fi
    # extract year and make sure the dir exists
    YEAR="${BETTER_DATE/-*/}"
    mkdir -p "$DIR/$YEAR"

    TARGET_DIR="$DIR/$YEAR/$BETTER_DATE"

    if [ -d "$TARGET_DIR" ]; then
      echo "$TARGET_DIR already exists, skipping $WEIRD_DATE"
      continue
    fi

    # converting successful and directory doesn't exist, so rename it
    echo "Renaming $SUBDIR to $TARGET_DIR"
    mv "$SUBDIR" "$TARGET_DIR"
  fi
done