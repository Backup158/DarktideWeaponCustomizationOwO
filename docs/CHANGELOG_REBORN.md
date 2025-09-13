# 2025-09-UNRELEASED
v0.1.0

Initial release for the rebuilt version in Discord

Laying the framework for me to readd parts
- functions for each group of attachments (ex suppressors together)
- functions to add a group of attachments to a weapon (or multiple at once)
- functions to copy over attachments to another weapon
    - used to propagate changes from mark to mark
    - and from family to family (ex ilas --> recon)
- defining the attachment functions globally in another file
    - worse performance but cleaner code
    - at startup and it's only a few function calls
    - i'm sure the auto mark propagation is worse than this
    - esp the table search lol

Added
- Suppressors
    - Infantry/Braced/Vigilant Autoguns, Infantry Lasguns