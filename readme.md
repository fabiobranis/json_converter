# Braze users file json converter


Simple converter for Braze exported files

## How to use
You need to export the users from `https://{{instance_url}}/users/export/segment` endpoint, extract the files to the assets folder in the root of this project and run `cargo run`.
Then you have a merged.json file, just import it into your mongo collection to work.