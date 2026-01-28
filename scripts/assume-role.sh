#!/bin/bash

# 引数チェック
if [ $# -lt 2 ]; then
  echo "Usage: assume-role-exec <role-arn> <command> [args...]" >&2
  echo "Example: assume-role-exec arn:aws:iam::123456789012:role/MyRole aws sts get-caller-identity" >&2
  exit 1
fi

role_arn=$1
shift

# 一時認証情報を取得
creds=$(aws sts assume-role \
  --role-arn "$role_arn" \
  --role-session-name "cli-session-$$" \
  --query 'Credentials' \
  --output json 2>&1)

# エラーチェック
if [ $? -ne 0 ]; then
  echo "Failed to assume role: $role_arn" >&2
  echo "$creds" >&2
  exit 1
fi

# サブシェルで実行（環境変数を汚さない）
(
  export AWS_ACCESS_KEY_ID=$(echo "$creds" | jq -r '.AccessKeyId')
  export AWS_SECRET_ACCESS_KEY=$(echo "$creds" | jq -r '.SecretAccessKey')
  export AWS_SESSION_TOKEN=$(echo "$creds" | jq -r '.SessionToken')
  exec "$@"
)
