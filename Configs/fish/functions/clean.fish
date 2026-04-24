function clean
    set orphans (pacman -Qdtq)

    if test (count $orphans) -gt 0
        echo "Removing orphan packages..."
        sudo pacman -Rns --noconfirm $orphans
    else
        echo "No orphan packages"
    end

    echo "Cleaning AUR dependencies..."
    yay -Yc --noconfirm

    echo "Cleaning package cache..."
    sudo pacman -Sc --noconfirm

    echo "Removing yay cache..."
    rm -rf ~/.cache/yay 

    echo "Cleaning logs..."
    sudo journalctl --vacuum-time=7d

    echo "Cleanup done"
end
