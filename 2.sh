#!/bin/bash

clear && echo ""
echo " JBZD Downloader " && echo " Oczekujace " && echo ""

# Prompt the user to enter the number of pages to download
read -p " Ile stron?: " num_pages

# Create a directory to store the downloaded images
mkdir -p memes
cd memes 
mkdir -p poczekalnia
cd poczekalnia|| exit

# Loop through the desired page range and download media files with class name "article-image" using wget
for ((page=1; page<=num_pages; page++))
do
    # Set the URL of the website with the page number
    website="https://jbzd.com.pl/oczekujace/$page"

    # Download all media files with class name "article-image" using wget
    wget -nd -r -l1 --no-parent -A jpg,jpeg,png,gif -H -Djbzd.com.pl -e robots=off -A "*/" -R "index.html*" -P . $website
done

# Exit the directory
cd ..
