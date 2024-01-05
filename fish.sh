#!/bin/bash

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

echo "omf install bobthefish"|fish

printf "set -g theme_display_hostname yes\n" >> ~/.config/fish/config.fish
printf "set -g theme_color_scheme dracula" >> ~/.config/fish/config.fish

#mkdir -p ~/.local/share/omf/themes/bobthefish/functions/
#
#printf "function fish_greeting -d \"What's up, fish?\"
#                  set_color $fish_color_autosuggestion
#                  uname -nmsr
#
#                  # TODO: \`command -q -s\` only works on fish 2.5+, so hold off on that for now
#                  command -s uptime >/dev/null
#                  and command uptime
#
#                  figlet wither|lolcat
#                  neofetch|lolcat
#
#                  set_color normal
#              end" > ~/.local/share/omf/themes/bobthefish/functions/fish_greeting.fish 
#
#mkdir -p ~/.config/fish/
#
#printf "if status is-interactive
#    # Commands to run in interactive sessions can go here
#end
#set -g theme_display_hostname yes" > ~/.config/fish/config.fish
#
#mkdir -p ~/.config/fish/functions/
#
#printf "function bobthefish_colors -S -d \'Define a custom bobthefish color scheme\'
#
#  # Optionally include a base color scheme
#  __bobthefish_colors default
#
#  # Then override everything you want!
#  # Note that these must be defined with \`set -x\`
#  set -x color_initial_segment_exit     white red --bold
#  set -x color_initial_segment_su       white green --bold
#  set -x color_initial_segment_jobs     white blue --bold
#
#  set -x color_path                     magenta white
#  set -x color_path_basename            magenta white --bold
#  set -x color_path_nowrite             magenta black
#  set -x color_path_nowrite_basename    magenta black --bold
#
#  set -x color_repo                     green black
#  set -x color_repo_work_tree           black black --bold
#  set -x color_repo_dirty               brred black
#  set -x color_repo_staged              yellow black
#
#  set -x color_vi_mode_default          brblue black --bold
#  set -x color_vi_mode_insert           brgreen black --bold
#  set -x color_vi_mode_visual           bryellow black --bold
#
#  set -x color_vagrant                  brcyan black
#  set -x color_k8s                      magenta white --bold
#  set -x color_username                 white black --bold
#  set -x color_hostname                 magenta white
#  set -x color_rvm                      brmagenta black --bold
#  set -x color_virtualfish              brblue black --bold
#  set -x color_virtualgo                brblue black --bold
#  set -x color_desk                     brblue black --bold
#end" > ~/.config/fish/functions/bobthefish_colors.fish
