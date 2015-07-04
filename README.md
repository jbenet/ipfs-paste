# ipfs-paste - paste to ipfs

Paste stuff to [IPFS](http://ipfs.io).

1. `ipfs add` stdin (or clipboard with `--paste`)
2. print + copy url to the HTTP gateway
3. prefetch on the gateway

(note: Today, clipboard only on OSX. Tomorrow, cross platform).

## Install

```sh
# install from ipfs
ipfs cat QmUuJtc89mfkD1x6hQC6n5vmMgG9beiLjQstfj6EYLH8MZ >/usr/local/bin/ipfs-paste
chmod +x /usr/local/bin/ipfs-paste

# install from http
curl -s https://github.com/jbenet/ipfs-paste/blob/master/ipfs-paste >/usr/local/bin/ipfs-paste
chmod +x /usr/local/bin/ipfs-paste
```

Note: requires running IPFS daemon.

## Usage

```sh
> ipfs-paste -h
ipfs-paste [-v] [--paste] [<name>]
publish stdin (or pasteboard) to ipfs
```

## Examples

```sh
# stdin to ipfs
> echo hello mars | ipfs-paste
http://gateway.ipfs.io/ipfs/QmZd56pN6zKvFrqp3ojRHHJQ2x2NWKTLmsEQbni37cDgvx/paste

# clipboard to ipfs
> echo hello mars | pbcopy
> pbpaste
hello mars
> ipfs-paste --paste
http://gateway.ipfs.io/ipfs/QmV3pQbmx9ziGt4r7i6wyJuSg7hovT6Znxo9PAEoo6M8qB/paste

# set a name to file
> head -c 1024 /dev/random | ipfs-paste rand-kb
http://gateway.ipfs.io/ipfs/QmctPRXHkmoQfZSKExNvcpPS7g1BQciarzWVM7QYdzS6eJ/rand-kb

# verbose
> cat ipfs-paste | ipfs-paste -v
stdin to ipfs... QmbSV3f1T5qbdfxfhSgrudRSv3YiJBxKFGthPAEDZVEhpj
constructing dir... QmYXNKmW7vyvpcTEtAUXGjJ8X9wmh1BgqmZLutFQYLhUev
copying url to clipboard... copied
http://gateway.ipfs.io/ipfs/QmYXNKmW7vyvpcTEtAUXGjJ8X9wmh1BgqmZLutFQYLhUev/paste
preloading on the gateways... ok
```
