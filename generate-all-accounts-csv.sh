#/bin/bash
echo "Genetaring accounts list"
aws organizations list-accounts | jq -r '.Accounts[] | [.Id,.Email] | @csv' | sed 's/\"//g'

