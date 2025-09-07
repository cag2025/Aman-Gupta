# This script interactively builds and runs a taup_pierce command.

# --- User Input ---

# 1. Select the velocity model
echo "Please select the velocity model:"
echo "  1) iasp91"
echo "  2) prem"
read -p "Enter your choice (1 or 2): " model_choice

case $model_choice in
    1)
        model="iasp91"
        ;;
    2)
        model="prem"
        ;;
    *)
        echo "Invalid choice. Please enter 1 or 2."
        exit 1
        ;;
esac

# 2. Get station coordinates
read -p "Enter the station latitude: " sta_lat
read -p "Enter the station longitude: " sta_lon

# 3. Get the seismic phase
read -p "Enter the seismic phase (e.g., SKS, P, etc.): " phase

# 4. Get the input file path
read -p "Enter the path to the input file (with event lat, lon, and depth): " event_file

if [ ! -f "$event_file" ]; then
    echo "Error: Input file not found at '$event_file'"
    exit 1
fi

# 5. Get the output file path
read -p "Enter the path to the input file (with event lat, lon, and depth): " output_file


if [ ! -f "$output_file" ]; then
    echo "Error: Input file not found at '$output_file'"
    exit 1
fi

# --- Execution ---

echo "Processing events from $event_file..."

# Loop through each line of the event file
while read -r lat lon depth; do
    # Construct and execute the taup_pierce command for each event
    # The output is printed to the standard output.
    /home/ancientai/Documents/7th_Sem/CAG2/Aman-Gupta/TauP-2.4.0/bin/taup_pierce \
        -mod "$model" \
        -h "$depth" \
        -sta "$sta_lat" "$sta_lon" \
        -evt "$lat" "$lon" \
        -ph "$phase" >> "$output_file"
done < "$event_file"

echo "Script finished."