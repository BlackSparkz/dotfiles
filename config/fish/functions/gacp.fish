function gacp
    cd ~/Dotfiles
    git add .

    if git commit -m "$argv"
        git push
    end
end
