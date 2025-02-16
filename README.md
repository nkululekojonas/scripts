# Bash Scripts

Welcome to my Bash scripts collection repository! This repository contains a variety of Bash scripts that were either proof of concept, or I use semi-regularly.

## Overview
This repository includes scripts that cover topics such as:
- Basic scripting and command-line arguments
- File manipulation and statistics
- Directory backup and log file analysis
- Process monitoring and interactive games
- Command-line options parsing
- Network connectivity checks
- Disk usage reporting
- Find and replace operations in files
- Automated software updates on Debian-based systems

Each script is self-contained and commented to explain its functionality.

## Scripts

1. **hello.sh**  
   *Prints "Hello, World!" or a personalized greeting if a name is provided as an argument.*

2. **calc.sh**  
   *A simple calculator that accepts two numbers and an operator (`+`, `-`, `*`, `/`) as arguments.*  
   - **Bonus:** Includes error checking for division by zero and invalid operators.

3. **filestats.sh**  
   *Displays the number of lines, words, and characters in a specified file, or shows an error if the file does not exist.*

4. **backup.sh**  
   *Creates a compressed tarball backup of a specified directory, with the backup file name including the current date.*

5. **loganalyzer.sh**  
   *Searches a log file (e.g., `/var/log/syslog`) for a specified keyword and counts how many times it appears.*

6. **procmon.sh**  
   *Monitors for a specific process by name, checking at regular intervals if it is running.*  
   - **Bonus:** Logs process start and stop events to a file.

7. **fileinfo.sh**  
   *Iterates over multiple filenames provided as arguments and, for each file, displays its size and last modification date, or an error if the file is not found.*

8. **guess.sh**  
   *An interactive "Guess the Number" game where the script selects a random number between 1 and 100 and prompts the user to guess it, providing hints along the way.*

9. **options.sh**  
   *Demonstrates command-line options parsing using `getopts`.*  
   - Supports options like `-f` for a filename, `-d` for a directory, and `-v` for verbose mode.  
   - **Bonus:** Displays a usage message when incorrect options are provided.

10. **netcheck.sh**  
    *Pings a list of hostnames or IP addresses provided as arguments to check network connectivity.*  
    - **Bonus:** Logs the results with timestamps to a log file.

11. **diskreport.sh**  
    *Uses the `df` command to report disk usage for the root directory and issues an alert if usage exceeds a certain threshold (e.g., 80%).*

12. **findreplace.sh**  
    *Searches for a specified string in all files within a directory (and its subdirectories) and replaces it with another string.*  
    - **Note:** Always back up your files before performing in-place replacements.

13. **update.sh**  
    *Automates software updates on Debian-based systems by checking for package updates using `apt-get update` and optionally applying them with `apt-get upgrade` if a `-y` flag is provided.*

## Usage

To use any of these scripts, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/nkululekojonas/bash-scripts.git
   cd bash-scripts
   ```
