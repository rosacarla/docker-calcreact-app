#!/bin/sh

# Get the token and build the bot URL:
BOT_URL="https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage"

# Set formatting for the message. Can be either "Markdown" or "HTML"
PARSE_MODE="Markdown"

# echo "${CI_JOB_STATUS}"

echo "${Deploy}"

# echo "${https://t.me/graf_my_bot}"
# echo "$TELEGRAM_TO"
# echo "${TELEGRAM_TO}"

# echo "${PARSE_MODE}"

# Define send message function. parse_mode can be changed to
# HTML, depending on how you want to format your message:

MESSAGE="
-------------------------------------
GitHub Actions build * ${Deploy}!*
\`Repository:  ${rosacarla/docker-calcreact-app}\`
\`Branch:      ${master}\`
*Commit Msg:*
${Finalizado!}
)
--------------------------------------
"

# echo "${MESSAGE}"
# echo "$MESSAGE"

curl -s -X POST ${https://t.me/graf_my_bot} -d chat_id=$TELEGRAM_TO -d text="${MESSAGE}" -d parse_mode=${PARSE_MODE}
