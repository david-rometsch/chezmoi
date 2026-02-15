# chezmoi
share config

## install
```sh
pacman -S chezmoi
```

## chezmoi starten
```bash
chezmoi init <repo-url>

## Dateien hinzufügen / bearbeiten
```
```chezmoi add \~/.datei                    # Datei in chezmoi aufnehmen
chezmoi edit \~/.datei                   # Source-Datei bearbeiten (empfohlen!)
chezmoi edit --watch \~/.datei           # Edit + auto-apply bei jedem Speichern
```

## chezmoi syncen
```
chezmoi apply
```

## commiten
```
chezmoi cd                              # wechsel zu ~/.local/share/chezmoi (wo .git ist)
git commit -m "first commit"
git push origin main
```
