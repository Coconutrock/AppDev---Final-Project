# CinemaHub — Movie Booking App

Simple PHP/MySQL movie booking application.

## Project layout
- Root PHP pages:
  - [index.php](index.php) — public homepage / movie listing
  - [booking.php](booking.php) — booking flow
  - [schedule.php](schedule.php) — schedule page
  - [contact-us.php](contact-us.php) — contact form
  - [verify.php](verify.php) — verification logic
  - [fail.html](fail.html) — failure page
- Admin area: `admin/`
  - Admin dashboard: [admin/admin.php](admin/admin.php)
  - Admin controllers & views: [admin/*.php](admin/)
  - DB config: [admin/config.php](admin/config.php)
- Shared:
  - Database SQL: [database/cinema_db.sql](database/cinema_db.sql)
  - Styles: [style/styles.css](style/styles.css)
  - Scripts: [scripts/script.js](scripts/script.js)
  - Includes: [includes/header.php](includes/header.php), [includes/footer.php](includes/footer.php)
  - Images: [img/](img/)

## Requirements
- PHP 7.0+ with mysqli
- MySQL / MariaDB
- Web server (Apache, Nginx) or PHP built-in server for local testing

## Quick setup (local)
1. Place repository in your webroot (e.g., XAMPP `htdocs`).
2. Create a database and import:
   - Import [database/cinema_db.sql](database/cinema_db.sql) into MySQL.
3. Update DB credentials:
   - Edit [connection.php](connection.php) (or [admin/config.php](admin/config.php)) to set DB host/user/password/name.
4. Start server and open:
   - http://localhost/path-to-repo/index.php

## Admin
- Visit [admin/admin.php](admin/admin.php). Admin pages check for a session variable (`$_SESSION['uname']`) in [admin/config.php](admin/config.php). Ensure you have a valid admin login flow or seed the users table.

## Styling / CSS not applying — common checks
- File exists: confirm [style/styles.css](style/styles.css) is present.
- Relative path correctness:
  - Public pages (e.g., [index.php](index.php)) link to `./style/styles.css`.
  - Admin pages (e.g., [admin/admin.php](admin/admin.php)) link to `../style/styles.css`.
  - If you move files or test via different base URLs, adjust the relative path or use absolute path `/your-repo/style/styles.css`.
- Browser caching: clear cache or hard-reload (Ctrl+F5).
- DevTools: open browser DevTools → Network and Console to see 404s or CSS parse errors.
- Multiple CSS overrides: check if Bootstrap or other CSS is loaded after your file (it may override your rules). In [admin/admin.php](admin/admin.php) Bootstrap is included via CDN.
- Confirm correct selectors: inspect elements to see which CSS file provides the applied rules.

## Troubleshooting tips
- If CSS 404s, the Network tab shows the requested path—use that to adjust the href.
- If PHP pages include headers from `includes/` or `admin/`, confirm those includes don't emit unexpected base tags or stray HTML.
- For DB errors, the code echoes mysqli errors in pages like [index.php](index.php) — check site output or server logs.

## Where to look for specific concerns
- CSS and layout: [style/styles.css](style/styles.css) and [includes/header.php](includes/header.php)
- JS behavior: [scripts/script.js](scripts/script.js)
- DB connection: [connection.php](connection.php) and [admin/config.php](admin/config.php)
- Admin dashboard: [admin/admin.php](admin/admin.php)

## Contributing / Notes
- Keep relative asset paths consistent across directories or switch to absolute paths from the webroot.
- Add basic unit tests or linting if you plan to extend functionality.
