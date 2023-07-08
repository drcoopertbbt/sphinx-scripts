#!/bin/bash

# Exit script if any command fails
set -e

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
mkdir docs
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

# Setup Sphinx
echo "Setting up Sphinx..."
echo -e "y\nsphinx-project\nDavid Kypuros\n1\nen\n\n\n\n\nn\n\n" | sphinx-quickstart

# Build the project
echo "Building the project..."
make html

# Update the html_theme in conf.py
echo "Updating the html_theme in conf.py..."
sed -i "s/html_theme = 'alabaster'/html_theme = 'sphinx_rtd_theme'/g" source/conf.py

# Download and replace the index.rst
echo "Replacing index.rst..."
wget https://raw.githubusercontent.com/drcoopertbbt/sphinx-scripts/main/initial-build-files/page1.rst -O source/index.rst

# Download page1.rst and page2.rst
echo "Adding page1.rst and page2.rst..."
wget https://raw.githubusercontent.com/drcoopertbbt/sphinx-scripts/main/initial-build-files/page1.rst -O source/page1.rst
wget https://raw.githubusercontent.com/drcoopertbbt/sphinx-scripts/main/initial-build-files/page2.rst -O source/page2.rst

# Install sphinx-autobuild
echo "Installing sphinx-autobuild..."
pip install sphinx-autobuild

# Navigate out of the docs directory and start the autobuild
echo "Starting autobuild..."
cd ..
sphinx-autobuild --host 0.0.0.0 --port 8080 docs/source docs/build/html

# Instructions for the final step
echo "Finally, go to 'ports' and click the icon of the 'globe'. Hovering should show you 'view in browser'."
