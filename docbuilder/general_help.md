

# General Usage:

  docker compose run --rm docbuilder [command]

If no [command] is provided, it will show this help.

This is also equivalent with running:
docker compose run --rm docbuilder help

This Makefile will convert your Markdown files
to *.docx, *.pptx, *.odt (unsupported) using custom reference styles for each type of document.

## Available help commands:
    * help - Show general help
    * help_refgen - Show detailed help for refgen usage.
    * help_build - Show detailed help for build usage.

## Available build commands:
 refgen_<destination>[_refstyle] - Generate reference style for the specified destination.
    For details, see help_refgen.

