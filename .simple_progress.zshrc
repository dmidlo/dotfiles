fetch_website_title() {
  url="$1"
  # Use curl to download the HTML content of the website
  html=$(curl -sL "$url")
  # Use xmllint to parse the HTML and extract the <title> tag, then use head to get only the first line
  title=$(echo "$html" | xmllint --html --xpath '//title/text()' - 2>/dev/null | head -n 1)
  echo "$title"
}

simple_progress() {
    # Help text
    help_text="Usage: progress_tracker <command> [<current_file> <master_file>]\n
Commands:\n
  report   - Compares the line counts of a master TODO list file and a current TODO list file.\n
            <master_file> should be the immutable master list of TODO items.\n
            <current_file> is a copy where items are removed as completed.\n
  next     - Opens the first URL from the current TODO list file in Google Chrome and removes it from the list.\n
The script outputs the total items, items completed, items remaining, and percent complete."
    
    if [ "$#" -ne 3 ]; then
        echo -e "$help_text"
        return 1
    fi

    current_file="$2"
    master_file="$3"

    # Process subcommands
    case "$1" in
        report)
            if [ ! -f "$master_file" ] || [ ! -f "$current_file" ]; then
                echo "Error: One or both files do not exist."
                echo -e "$help_text"
                return 1
            fi

            total_items=$(wc -l < "$master_file")
            items_remaining=$(wc -l < "$current_file")
            items_completed=$((total_items - items_remaining))
            percent_complete=$(echo "scale=2; $items_completed / $total_items * 100" | bc -l)

            echo "\nProgress Tracker Report:"
            echo "------------------------"
            echo "Total Items: $total_items"
            echo "Items Completed: $items_completed"
            echo "Items Remaining: $items_remaining"
            printf "Percent Complete: %.2f%%\n" "$percent_complete"
            echo "\n"

            ;;
        next)
            url_to_open=$(head -n 1 "$current_file")

            if [ -z "$url_to_open" ]; then
                echo "No URL found in $current_file."
                return 1
            fi

            # Use a universally compatible method to remove the first line
            # This uses a temporary file to store the changes
            tail -n +2 "$current_file" > "${current_file}.tmp" && mv -f "${current_file}.tmp" "$current_file"
            simple_progress report $current_file $master_file

            echo "Opening...\n  Title: $(fetch_website_title $url_to_open)\n    URL: \n    $url_to_open\n\n"
            open -a "Google Chrome" "$url_to_open"

            next_url=$(head -n 1 "$current_file")
            echo "Next Up...\n  Title: $(fetch_website_title $next_url)\n    URL: \n    $next_url\n\n"
            ;;
    esac
}

# Example usage:
# To generate a report: progress_tracker report master_list.txt current_list.txt
# To open the next URL and mark it as complete: progress_tracker next current_list.txt