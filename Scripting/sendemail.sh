#!/bin/bash
Recipient="kjlee_t@oppstar.com.my"
Mysubject="hi"
Mymessage="Just for fun"

mail -s "$Mysubject" "$Recipient" <<< "$Mymessage"
