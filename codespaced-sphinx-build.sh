#!/bin/bash

# Script for setting up Sphinx in GitHub CodeSpaces

# Check the Python and pip versions
echo "Python and pip versions:"
python3 --version
pip --version

# Install and activate virtualenv
echo "Setting up virtual environment..."
python3 -m pip install --user virtualenv
python3 -m venv venv
source venv/bin/activate

# Create a new directory named docs and navigate into it
echo "Moving into docs directory..."
cd docs

# Install sphinx
echo "Installing sphinx..."
pip install sphinx

# Install sphinx themes and plugins
echo "Installing sphinx themes and plugins..."
pip install sphinx-rtd-theme
pip install sphinx-copybutton
pip install sphinxcontrib-youtube 
pip install sphinxcontrib-mermaid 
pip install sphinx-book-theme 
pip install sphinx-material

# Update the html_theme in conf.py
echo "Updating the html_theme in conf.py..."
sed -i "s/html_theme = 'pyramid'/html_theme = 'sphinx_rtd_theme'/g" source/conf.py

# Build the project
echo "Building the project..."
make html

# Install sphinx-autobuild
echo "Installing sphinx-autobuild..."
pip install sphinx-autobuild

# Navigate out of the docs directory and start the autobuild
echo "Starting autobuild..."
cd ..
sphinx-autobuild --host 0.0.0.0 --port 8080 docs/source docs/build/html

# Instructions for the final step
echo "Finally, go to 'ports' and click the icon of the 'globe'. Hovering should show you 'view in browser'."
