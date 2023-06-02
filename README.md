# WebpConverter

This repo provides to convert all images to webp format. This script check the current folders and subfolders. Webp files converted where the same path and the same name.

> You have to already install the "webp" in your machine for use the script.
> You may check the [link](https://developers.google.com/speed/webp/docs/precompiled)  If not installed the webp.

# Usage

- Download the sh file to parent images folder.
- Open the terminal and go to the folder
- run the sh file. You may follow the code.

		sh webp-convert.sh

**Allowed parameters**

You may want to control compression method or quality so you may set those values using like bellow the code.

		sh webp-convert.sh -m 6 -q 90

| Parameter | Description  |
|--|--|
| -m | Compression method (0=fast, 6=slowest), default=4 |
| -q | Quality factor (0:small..100:big), default=75 |
| -h / --help | Display this help message |

