# Review Checklist

## Build reproducibility

- [ ] Build command is documented.
- [ ] Build does not depend on hidden host paths.
- [ ] Toolchain assumptions are documented.

## Hardcoded paths

- [ ] No personal absolute paths.
- [ ] Board paths are configurable.
- [ ] Docker paths use `/work` consistently.

## Makefile clarity

- [ ] Targets are clear.
- [ ] Variables are overridable.
- [ ] `clean` does not delete source or documentation.

## Error handling

- [ ] C return values are checked.
- [ ] System call failures are handled.
- [ ] Error messages are useful.

## Resource cleanup

- [ ] Allocated resources are released.
- [ ] Failure paths release partial resources.
- [ ] Cleanup order is symmetric with initialization.

## README accuracy

- [ ] Build steps are accurate.
- [ ] Deploy steps are accurate.
- [ ] Run and expected output are documented.

## Git status cleanliness

- [ ] Generated files are ignored or intentionally tracked.
- [ ] No large local files are staged.
- [ ] No secrets are staged.

## For Linux drivers

- [ ] `init` / `exit` paths are symmetric.
- [ ] `probe` / `remove` paths are symmetric.
- [ ] `copy_to_user` / `copy_from_user` return values are checked.
- [ ] IRQ context does not sleep.
- [ ] wait queue usage is correct.
- [ ] `poll` behavior is correct.
- [ ] locking is correct.
- [ ] device tree matching is correct.
