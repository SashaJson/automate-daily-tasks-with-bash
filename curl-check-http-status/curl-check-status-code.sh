check_status() {
  local status=$(curl -ILs $1 | head -n 1 | cut -d ' ' -f 2)
  if [[ $status -lt 200 ]] || [[ $status -gt 299 ]]; then 
    echo "$1 failed with a $status"
    return 1
  else 
    echo "$1 succeeded with a $status"
  fi 
}

check_status http://example.com/
check_status http://example.com/404

