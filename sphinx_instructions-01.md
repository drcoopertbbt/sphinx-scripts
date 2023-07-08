## Special section for using GitHub CodeSpaces

### You can use this script to build the initial sphinx environment.

bash <(curl -s https://raw.githubusercontent.com/drcoopertbbt/sphinx-scripts/main/codespaced-sphinx-build.sh)

### You can just run this script - update the build

bash <(curl -s https://raw.githubusercontent.com/drcoopertbbt/sphinx-scripts/main/codespaces-sphinx-localdev.sh)


see: 
https://docs.github.com/en/codespaces/developing-in-codespaces/forwarding-ports-in-your-codespace

```bash
python3 --version
pip --version
```

```bash
python3 -m pip install --user virtualenv
python3 -m venv venv
source venv/bin/activate
```

```bash
mkdir docs
cd docs
pip install sphinx
```

```bash
pip install sphinx-rtd-theme
```

```bash
pip install sphinx-copybutton
```

```bash
make html
```

```bash
pip install sphinx-autobuild
```

```bash
cd ..
sphinx-autobuild --host 0.0.0.0 --port 8080 docs/source docs/build/html
```

## Finally
Got to "ports" and click the icon of the "globe" and hovering should show you view in browser.
