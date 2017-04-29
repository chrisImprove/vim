#! /bin/bash

echo "******    This file is used for generate tags ******"
echo "* 1. generate C tags"
echo "* 2. generate C++ tags"
echo "* 3. generate php tags"
echo "****************************************************"

program_exists() {
    local ret='0'
    command -v $1 >/dev/null 2>&1 || { local ret='1';  }

     # fail on non-zero return value
    if [ "$ret" -ne 0  ]; then
       return 1
    fi

    return 0
}

program_must_exist() {
    program_exists $1

    # throw error on non-zero return value
    if [ "$?" -ne 0  ]; then
        error "You must have '$1' installed to continue."
        exit
    fi
}

msg() {
    printf "%b\n" "$1" >&2
}

success() {
    if [ "$ret" -eq '0' ]; then
        msg "\33[32m[✔]\33[0m ${1}${2}"
    fi
}

error() {
    msg "\33[31m[✘]\33[0m ${1}${2}"
    exit 1
}

generate_tags() {
    read -p "Please type which folder : " folder

    if [ -d $folder ]; then
        cd $folder
        ret="$?"
        success "cd $folder now..."
    else
        error "$folder is not a dir"
    fi
}

pick_choice() {
    read -p "Please type you choice(1/2/3/q) : " choice

    case $choice in
        1)
            generate_tags
            ctags –R src
            ;;
        2)
            generate_tags
            ctags -R --c++-kinds=+p --fields=+iaS --extra=+q src
            ;;
        3)
            generate_tags
            ctags -R --fields=+aimS --languages=php \
            --exclude=.git
            ;;
        *)
            error "Sorry...  you pick exit generate tags..."
            exit
    esac
}


#################Main Fun#####################
program_must_exist "ctags"

pick_choice

