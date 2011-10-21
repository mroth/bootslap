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

#give me the newest touched file, recursively
function newest {
	if [ -n "$1" ]; then
		DIR=$1
	else
		DIR="."
	fi
	find ${DIR} -type f -print |
	perl -l -ne '$_{$_} = -M; END {$,="\n";print sort {$_{$b} <=> $_{$a}} keys %_;}' |
	tail -n1
}

#quick visual check of the most recent lolcommit
function vanity { 
	open `newest ~/.lolcommits/` 
}