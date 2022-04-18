# SCP ACTION
***By SRUEDA99***

## Overview
This action to copy the files from your repository to a remote server using **SCP** (Secure Copy Protocol).

## How to use it
You must give:
- The `host` which is the public address or the public DNS of the destination server.
- The `username` that will be used in the remote server.
- The `destination` folder, where the content will be copied.
- The `password` for the user or the private `key` in case the connection is based on SSH keys.

Optional:
- The `origin` folder is set by default as _"./*"_ but you can also specify it.
- The `port` is set as **22** by default, you can also specify another one.
- The `passphrase` if necessary.

**IMPORTANT**
```
Use Github secrets to give these parameters.
```

## Examples
**With password**
```
name: copy using password
uses: srueda99/scp-action@v3
with:
    port: 22
    host: ${{ secrets.SERVER_ADDRESS }}
    destination: "/home/${{ secrets.SERVER_USERNAME }}/"
    username: ${{ secrets.SERVER_USERNAME }}
    password: ${{ secrets.SERVER_PASSWORD }}
```

**With key**
```
name: copy using key
uses: srueda99/scp-action@v3
with:
    port: 22
    host: ${{ secrets.SERVER_ADDRESS }}
    destination: "/home/${{ secrets.SERVER_USERNAME }}/"
    username: ${{ secrets.SERVER_USERNAME }}
    key: ${{ secrets.SERVER_KEY }}
```

**With origin folder**
```
name: copy using password
uses: srueda99/scp-action@v3
with:
    port: 22
    host: ${{ secrets.SERVER_ADDRESS }}
    origin: "./*"
    destination: "/home/${{ secrets.SERVER_USERNAME }}/"
    username: ${{ secrets.SERVER_USERNAME }}
    password: ${{ secrets.SERVER_PASSWORD }}
```

**With passphrase**
```
name: copy using key
uses: srueda99/scp-action@v3
with:
    port: 22
    host: ${{ secrets.SERVER_ADDRESS }}
    destination: "/home/${{ secrets.SERVER_USERNAME }}/"
    username: ${{ secrets.SERVER_USERNAME }}
    key: ${{ secrets.SERVER_KEY }}
    passphrase: ${{ secrets.SERVER_PASSPHRASE }}
```

Enjoy it!!