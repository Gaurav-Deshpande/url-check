# url-check
The script reads each URL from the file line by line to check Url status
Explanation:
URL_FILE="urls.txt": This variable holds the name of the text file containing the URLs.
Check if the file exists: The script checks if the file exists and exits with an error message if it doesn't.
Read URLs from the file: The script reads each URL from the file line by line.
Check their status: For each URL, the script uses curl to make an HTTP request and retrieves the status code. The status code is then printed along with the URL.
Usage:
Save the script to a file, for example, uc.sh.
Make the script executable: chmod +x uc.sh.
Run the script: ./uc.sh.
Make sure your urls.txt file contains one URL per line. This script will read up to 50 URLs from the file and check their status.

Feel free to let me know if you need any modifications or additional features!
