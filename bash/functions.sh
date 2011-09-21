# cribbed from norm
function source_if_exists {
    file=${1}
    
    if [ -f ${file} ]; then
        source ${file}
    fi
}

# some defaults in case sourced files aren't there
function __git_ps1 {
  false
}
