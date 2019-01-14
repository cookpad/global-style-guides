# Python

- <a name="use-pep8"></a>
  Follow [PEP8](https://pep8.org/) style guide. 
  PyCharm users should enable automatic pep8 warnings.


- <a name="multi-line-statements"></a>
 PEP8 specifies a line length limit of 79 characters. Please try to adhere to this. If you have a specific reason for requiring a longer line length then this should be discussed in the review process. In this case, you must not extend beyond 125 characters per line, the limit on character length in the Github diff view. For multi-line statements, use the backslash `\` to indicate next-line continuation. Next line continuation should use indentation.
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


- <a name="use-type-hinting"></a>
  Use type hinting according to PEP-484 and type-check at build time with a tool (e.g. [pyre](https://github.com/facebook/pyre-check))

- <a name="naming-conventions"></a>

  Use the following naming conventions (borrowed from [Google's Python style guide](https://github.com/google/styleguide/blob/gh-pages/pyguide.md)).
	<table rules="all" border="1" summary="Guidelines from Guido's Recommendations"
       cellspacing="2" cellpadding="2">

  <tr>
    <th>Type</th>
    <th>Public</th>
    <th>Internal</th>
  </tr>

  <tr>
    <td>Packages</td>
    <td><code>lower_with_under</code></td>
    <td></td>
  </tr>

  <tr>
    <td>Modules</td>
    <td><code>lower_with_under</code></td>
    <td><code>_lower_with_under</code></td>
  </tr>

  <tr>
    <td>Classes</td>
    <td><code>CapWords</code></td>
    <td><code>_CapWords</code></td>
  </tr>

  <tr>
    <td>Exceptions</td>
    <td><code>CapWords</code></td>
    <td></td>
  </tr>

  <tr>
    <td>Functions</td>
    <td><code>lower_with_under()</code></td>
    <td><code>_lower_with_under()</code></td>
  </tr>

  <tr>
    <td>Global/Class Constants</td>
    <td><code>CAPS_WITH_UNDER</code></td>
    <td><code>_CAPS_WITH_UNDER</code></td>
  </tr>

  <tr>
    <td>Global/Class Variables</td>
    <td><code>lower_with_under</code></td>
    <td><code>_lower_with_under</code></td>
  </tr>

  <tr>
    <td>Instance Variables</td>
    <td><code>lower_with_under</code></td>
    <td><code>_lower_with_under</code> (protected)</td>
  </tr>

  <tr>
    <td>Method Names</td>
    <td><code>lower_with_under()</code></td>
    <td><code>_lower_with_under()</code> (protected)</td>
  </tr>

  <tr>
    <td>Function/Method Parameters</td>
    <td><code>lower_with_under</code></td>
    <td></td>
  </tr>

  <tr>
    <td>Local Variables</td>
    <td><code>lower_with_under</code></td>
    <td></td>
  </tr>

</table> 




