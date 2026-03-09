function pacclean
    echo "Removing orphan packages..."
    paru -Qtdq | paru -Rns -

    echo "Cleaning package cache..."
    paru -Sc --noconfirm

    echo "System cleanup done."
end
