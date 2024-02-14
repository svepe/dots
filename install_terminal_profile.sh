#!/bin/bash
dconfdir=/org/gnome/terminal/legacy/profiles:

create_new_profile() {
    local profile_ids=($(dconf list $dconfdir/ | grep ^: | sed 's/\///g' | sed 's/://g'))
    local profile_name="$1"
    local profile_ids_old="$(dconf read "$dconfdir"/list | tr -d "]")"
    local profile_id="$(uuidgen)"

    [ -z "$profile_ids_old" ] && local profile_ids_old="["  # if there's no `list` key
    [ ${#profile_ids[@]} -gt 0 ] && local delimiter=,  # if the list is empty
    dconf write $dconfdir/list \
        "${profile_ids_old}${delimiter} '$profile_id']"
    dconf write "$dconfdir/:$profile_id"/visible-name "'$profile_name'"
    echo $profile_id
}

# Create profile
profile_id=$(create_new_profile tokyonight)
dconf load "$dconfdir/:$profile_id"/ < tokyonight-theme-profile.dconf

# Load profile with
# dconf load /org/gnome/terminal/legacy/profiles:/:b9decde8-1f5f-4ff0-970d-7a07a93bd776/ < tokyonight-theme-profile.dconf

# Dump profile with
# dconf dump /org/gnome/terminal/legacy/profiles:/:b9decde8-1f5f-4ff0-970d-7a07a93bd776/ > tokyonight-theme-profile.dconf
