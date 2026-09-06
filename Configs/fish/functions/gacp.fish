function gacp
    if test (count $argv) -eq 0
        echo "Plz write commit message"
        return
    end

    cd ~/hobbyist-dotfiles/
    python3 ~/hobbyist-dotfiles/Configs/Scripts/structure_update.py
    git add .

    if git commit -m (string join " " $argv)
        git push
    end

    cd
end
