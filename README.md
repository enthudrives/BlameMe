BlameMe
=======

This is a simple gem to get the list of contributors for any github repository. Doesn't require authentication.

Usage:
======
	require 'blame_me'
	BlameMe.contributors 'user', 'repo'

Example: 
	For the repository https://github.com/joey/food - 
 
	BlameMe.contributors 'joey', 'food'
