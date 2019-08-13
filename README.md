# Build AVR tool chain inside containers
Have a look at [Building and Installing the GNU Tool Chain][1] from microchip
for upstream documentation.

## [WIP] Usage

Keep in mind: This is a work in progress.

The image is currently based on `alpine` and that means it should be linked
with `musl`. If this affects the avr tool chain, is still unknown to me.
Further testing has to be done.

Running the container will result in a newly compiled avr toolchain, provided
you mounted a local directory as `avr-toolchain` inside the container.

### Building the container
```
podman build -t avr_toolchain:latest .
```

### Compiling the toolchain
```
# run the container while mounting `/avr-toolchain` to a local directory.
podman run -ti -v $(pwd)/avr:/avr-toolchain avr_toolchain:latest

# After the container (sucessfully) exit, you can find the toolchain the
# directory you mounted inside the container.
```

### Using the toolchain
You can use the toolchain inside the container:
```
podman run -ti --entrypoint /bin/sh \
           -v $(pwd)/avr:/avr-toolchain \
           -v $(pwd):/app \
           avr_toolchain:latest
```
*or* you use the toolchain on your local machine if you have a musl installation:
```
# Add avr binaries to your PATH
export PATH=${PATH_TO_TOOLCHAIN}/bin:$PATH
```

[1]: https://www.microchip.com/webdoc/AVRLibcReferenceManual/install_tools.html
