# #!/bin/bash
# nautilus_dir=$(gdbus call --session --dest org.gnome.Nautilus \
#               --object-path /org/gnome/Nautilus \
#               --method org.freedesktop.DBus.Properties.Get \
#               org.gnome.Nautilus.FileManager current_directory \
#               | sed 's/^.*variant://g' | tr -d '"')

# if [[ -d "$nautilus_dir" ]]; then
#     echo "Current directory: $nautilus_dir"
#     kitty --working-directory "$nautilus_dir"
# else
#     echo "Current directory: $nautilus_dir"
#     kitty
# fi

pid=$(hyprctl clients | grep -A 5 "org.gnome.Nautilus" | grep "pid" | awk -F': ' '{print $2}')
current_directory=$(gdbus call --session --dest org.gnome.Nautilus --object-path /org/gnome/Nautilus --method org.gnome.Nautilus.GetCurrentDirectory)

echo "PID: $pid"
echo "Current Directory: $current_directory"