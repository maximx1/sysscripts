#!/bin/bash
#System script that step by step prompts
#	installation of a dev-language environment.
# Justin Walrath <walrathjaw@gmail.com>

echo "Would you like to install gcc? "
read response
if [ $response = "y" ] || [ $response = "yes" ]; then
	sudo apt-get install gcc
fi

echo "Would you like to install g++? "
read response
if [ $response = "y" ] || [ $response = "yes" ]; then
	sudo apt-get install g++
fi

echo "Would you like to install ncurses for c? "
read response
if [ $response = "y" ] || [ $response = "yes" ]; then
	sudo apt-get install libncurses5-dev
fi

echo "Would you like to install golang? "
read response
if [ $response = "y" ] || [ $response = "yes" ]; then
	sudo apt-get install golang
fi

echo "Would you like to install mono-complete? "
read response
if [ $response = "y" ] || [ $response = "yes" ]; then
	sudo apt-get install mono-complete
fi

echo "Would you like to install python 2.7? "
read response
if [ $response = "y" ] || [ $response = "yes" ]; then
	sudo apt-get install python2.7
fi

echo "Would you like to install python 3.2? "
read response
if [ $response = "y" ] || [ $response = "yes" ]; then
	sudo apt-get install python3.2
fi
