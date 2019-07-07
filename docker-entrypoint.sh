#!/bin/sh

ACCOUNT_FILE=account.csv

if [ -z "${TARGET_ACCOUNT_ID}" ]; then echo "TARGET_ACCOUNT_ID not set !"; exit 1; fi
if [ -z "${TARGET_ACCOUNT_EMAIL}" ]; then echo "TARGET_ACCOUNT_EMAIL not set !"; exit 1; fi
if [ -z "${GUARDDUTY_MASTER_ACCOUNT}" ]; then echo "GUARDDUTY_MASTER_ACCOUNT not set !"; exit 1; fi
if [ -z "${GUARDDUTYRECRUITER_ROLE}" ]; then echo "RECRUITER_ROLE not set !"; exit 1; fi

if [ "${TARGET_ACCOUNT_ID}" = "${GUARDDUTY_MASTER_ACCOUNT}" ]; then echo "TARGET_ACCOUNT_ID is the master account !"; exit 1; fi

echo "Generating accounts list"
echo "${TARGET_ACCOUNT_ID},${TARGET_ACCOUNT_EMAIL}" > ${ACCOUNT_FILE}

echo "Recruiting account ${TARGET_ACCOUNT_ID} with email ${TARGET_ACCOUNT_EMAIL}"
python3.7 enableguardduty.py \
          --master_account ${GUARDDUTY_MASTER_ACCOUNT} \
          --assume_role ${GUARDDUTYRECRUITER_ROLE} \
          ${ACCOUNT_FILE}
