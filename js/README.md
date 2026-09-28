# JavaScript development dependencies

Use Node.js 22 or later and npm 8.3 or later (required for dependency overrides).
Install the locked dependencies with `npm ci` and check them with `npm audit`.

The Grunt plugins target Grunt 1.x; Socket.IO targets 4.x. Existing projects
copied from this template may need their Grunt configuration and Socket.IO
clients updated when adopting these versions.

Overrides keep the legacy plugins from installing vulnerable Bower, Lodash,
Minimatch, and underscore.string releases. Keep the overrides and lockfile
when copying this template, and rerun plugin checks when updating them.
