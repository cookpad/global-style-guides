# Python

- <a name="use-pep8"></a>
  Follow [PEP8](https://pep8.org/) style guide. 
  PyCharm users should enable automatic pep8 warnings.
  <sup>[link](#use-pep8)</sup>

- <a name="multi-line-statements"></a>
  Restrict line length to 120 characters. For multi-line statements, use the backslash `\` to indicate next-line continuation. Next line continuation should use indentation.
    <sup>[link](#multi-line-statements)</sup>
    <details>
    <summary><em>Example</em></summary>

    ```python
    string_variable = "This string variable is " \
                  	  "defined over two lines"
    ```
  </details>

- <a name="run-pylint"></a>
  Run [pylint](https://pylint.readthedocs.io/en/1.9/user_guide/ide-integration.html) over your code.
  You can configure your editor to run pylint on your project.
    <sup>[link](#run-pylint)</sup>
    <details>
    <summary><em>Example</em></summary>

    ```bash
    $ pip install pylint
    
    # run on a python file
    $ pylint my_python_file.py
    
    # run on a python project
    $ pylint my-project/
    ```
  </details>

- <a name="use-docstrings"></a>
  Use docstrings to document your code. These are detailed in [PEP 257](https://www.python.org/dev/peps/pep-0257/) [pylint](https://pylint.readthedocs.io/en/1.9/user_guide/ide-integration.html). Make sure that you document at class level, class methods, functions. Use Google style docstrings - see [examples](https://sphinxcontrib-napoleon.readthedocs.io/en/latest/example_google.html). (Pycharm users can configure these to populate automatically.)
  <sup>[link](#use-docstrings)</sup>

- <a name="use-type-hinting"></a>
  Use type hinting according to PEP-484 and type-check at build time with a tool (e.g. [pyre](https://github.com/facebook/pyre-check))
  <sup>[link](#use-type-hinting)</sup>

- <a name="naming-conventions"></a>
  Use the following naming conventions (borrowed from [Google's Python style guide](https://github.com/google/styleguide/blob/gh-pages/pyguide.md)).
  <sup>[link](#naming-conventions)</sup>

Type | Public | Internal
-- | -- | --
Packages | `lower_with_under` |  
Modules | `lower_with_under` | `_lower_with_under`
Classes | `CapWords` | `_CapWords`
Exceptions | `CapWords` |  
Functions | `lower_with_under()` | `_lower_with_under()`
Global/Class Constants | `CAPS_WITH_UNDER` |` _CAPS_WITH_UNDER`
Global/Class Variables | `lower_with_under | `_lower_with_under`
Instance Variables | `lower_with_under` | `_lower_with_under` (protected)
Method Names | `lower_with_under()` | `_lower_with_under()` (protected)
Function/Method Parameters | `lower_with_under` |  
Local Variables | `lower_with_under`
