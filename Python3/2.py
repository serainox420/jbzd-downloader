import os
import requests
# Make sure to install beautifulsoup4
#  pip3 install beautifulsoup4
from bs4 import BeautifulSoup

print("\n JBZD Downloader\n Oczekujace\n")

# Prompt the user to enter the number of pages to download
num_pages = int(input("Ile stron?: "))

# Create a directory to store the downloaded images
os.makedirs("memes/poczekalnia", exist_ok=True)
os.chdir("memes/poczekalnia")

# Loop through the desired page range and download media files with class name "article-image"
for page in range(1, num_pages + 1):
    # Set the URL of the website with the page number
    website = f"https://jbzd.com.pl/oczekujace/{page}"

    # Send a GET request to the website
    response = requests.get(website)

    # Parse the HTML content using BeautifulSoup
    soup = BeautifulSoup(response.text, 'html.parser')

    # Find all media files with class name "article-image"
    media_files = soup.find_all(class_="article-image")

    # Download each media file
    for file in media_files:
        file_url = file.get('data-src') or file.get('srcset') or file.get('src')
        if file_url:
            file_name = file_url.split('/')[-1]
            response = requests.get(file_url)
            with open(file_name, 'wb') as f:
                f.write(response.content)

# Exit the directory
os.chdir("../..")
