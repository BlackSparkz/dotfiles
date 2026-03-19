function gacp
    if test (count $argv) -eq 0
        echo "Plz write commit message"
        return
    end

    cd ~/Dotfiles
    git add .

    if git commit -m "$argv";
        git push
    end

    cd ~
end
