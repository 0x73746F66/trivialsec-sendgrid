#!/usr/bin/env bash
PRIMARY='\033[1;36m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color
echo -e "${PRIMARY}
 _____      _       _       _ __
/__   \_ __(_)_   _(_) __ _| / _\ ___  ___
  / /\/ '__| \ \ / / |/ _\` | \ \ / _ \/ __|
 / /  | |  | |\ V /| | (_| | |\ \  __/ (__
 \/   |_|  |_| \_/ |_|\__,_|_\__/\___|\___|
                                           ${NC}"
if [[ -f .env ]]; then
  source .env
else
  cp .env-example .env
  nano .env
  source .env
fi

[ -z "${TF_VAR_sendgrid_api_key}" ] && echo -e "${RED}TF_VAR_sendgrid_api_key not set${NC}"
export TF_VAR_sendgrid_api_key=${TF_VAR_sendgrid_api_key:-$SENDGRID_API_KEY}
export TF_VAR_aws_access_key_id=${TF_VAR_aws_access_key_id:-$AWS_ACCESS_KEY_ID}
export TF_VAR_aws_secret_access_key=${TF_VAR_aws_secret_access_key:-$AWS_SECRET_ACCESS_KEY}
[ -z "${TF_VAR_aws_access_key_id}" ] && echo -e "${RED}AWS_ACCESS_KEY_ID (or TF_VAR_aws_access_key_id) not set${NC}"
[ -z "${TF_VAR_aws_secret_access_key}" ] && echo -e "${RED}AWS_SECRET_ACCESS_KEY (or TF_VAR_aws_secret_access_key) not set${NC}"
aws sts get-caller-identity
git fetch
git status
echo -e "${PRIMARY}$(make --version)${NC}\n$(make help)"
