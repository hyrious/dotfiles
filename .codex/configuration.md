# Configuration

Default is none. One success proves the behavior works, not that it should be
optional. Try first: hardcode it, delete the old path, or do nothing.

Stop and ask the user when the motive is:

- "So the developer can switch it." They can also revert a commit.
- "So the next attempt passes." One-off pass rate is not a feature.

The ask must answer: what breaks without it, who flips it by name, when it gets
deleted. "Nobody" or "later" means no.

A config needs a second real consumer; hypothetical users and future flexibility
don't count. One caller means inline it. A toggle untouched by two refactors
gets deleted.
