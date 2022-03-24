#!/bin/bash

eww_install()
{
    pushd ./eww

    if [[ $1 == "wayland" ]]
    then
        cargo build --release --no-default-features --features=wayland
    else
        cargo build --release
    fi
}
