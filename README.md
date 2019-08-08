# Build AVR tool chain inside containers
Have a look at `SmartGH/notes/ressources.md` to find upstream documentation.

## [WIP] Usage

Keep in mind: This is a work in progress.

The image is currently based on `alpine` and that means it should be linked
with `musl`. If this affects the avr tool chain, is still unknown to me.
Further testing has to be done.

### Building the container
```
podman build -t avr_toolchain:latest .
```
### Running
```
# run the container while mounting `/avr-toolchain` to a local directory.
podman run -ti -v $(pwd)/avr:/avr-toolchain avr_toolchain:latest

# After the container (sucessfully exit), you can find the toolchain the
# directory you mounted inside the container.
```
