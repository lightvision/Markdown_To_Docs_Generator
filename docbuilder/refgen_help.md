

# Usage:

  refgen_<destination>[_refstyle]
  Generate reference style for your documentation in the **styles** directory.

## Parameters:
  **<destination>** (required) - The destination directory in which we will extract the [_refstyle].
  **[_refstyle]** (optional) - The reference style to be generated. Available options: `docx`, `pptx`, `odt`.
  If missing, 'all' is implied.

* If the **destination** directory doesn't exist, it will be created in the styles directory.

* If the **[_refstyle]** already exists, then it will not be overwritten.

