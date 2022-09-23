#!/bin/bash
# Simple build and install script

# Uninstall SimSpark
cd SimSpark

(cd spark/build && sudo make uninstall )

# Uninstall rcssserver3d
(cd rcssserver3d/build && sudo make uninstall)

# Uninstall rsgedit
(cd rsgedit/build && sudo make uninstall)

# Uninstall simspark-utilities
(cd simspark-utilities/build && sudo make uninstall)