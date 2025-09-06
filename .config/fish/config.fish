
set fish_greeting
set -gx FISH_RUNNING 1

function prompt_pwd
    echo (string replace $HOME '~' (pwd)) 
end

function fish_prompt

    set icons 󰣎 󰣏 󰣑 󰋑
    echo -e ""

    set_color --bold '#FF9E3B'
    echo -n "   "
    echo -n (prompt_pwd)

    if test -n "$IN_NIX_SHELL"
        set_color --bold "#496a9c"
        if test "$IN_NIX_SHELL" = "pure"
            echo -n " ( :pure) "
        else
            echo -n " (:impure) "
        end
    end

    set_color normal
    echo -e ""

    # set_color --bold '#FF5D62'
    # echo -n " 󰘍 "

    set icon $icons[(random 1 (count $icons))]

    switch $icon
        case '󰣎' '󰣑'
            set_color --bold '#a0d5e9'
        case '*'
            set_color --bold '#DB5079'
    end


    echo -n " $icon  "

    set_color normal
end
