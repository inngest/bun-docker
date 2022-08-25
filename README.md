# Cross platform bun

Bun, but everywhere.  This image provides cross-platform Bun images for docker so that
you can run Bun everywhere with native speed.

## Why?

Without an `arm64` image for `aarch64` kernels, Bun can't live up to its promise.  It'll
install slower than NPM under duress, as your container runtime will have to _virtualize_
the x86 calls to arm using qemu.

## How slow are we talking?

Deathly slow, my friend.  How long do you have?
