Ring programming language - Documents folder
============================================

In this folder we store the Ring programming language documentation 

Optional packages:

	ringpm install ringhelpchm
	ringpm install ringhelppdf
	ringpm install ringhelphtml	

The documentation is created using Sphinx (A popular tool written in Python)

-  Install Python (Tested using Python 3.11.5)

-  Install Sphinx (Tested using v6.2.1) 

	pip install -U sphinx==6.2.1

-  To use the pygments lexer, copy ring.py to Python\Lib\site-packages\pygments\lexers

-  Add the next line to _mapping.py

	'RingLexer': ('pygments.lexers.ring', 'Ring', ('ring',), ('*.ring',), ('text/ring',)),

-  Then run _mapping.py
	
	python _mapping.py

-  Install rtd_theme (Tested using v1.3.0)

	pip install sphinx_rtd_theme

-  Install copybutton 

	pip install sphinx-copybutton

-  Install sphinx-rtd-dark-mode

	pip install sphinx-rtd-dark-mode

-  To generate CHM file, Use Microsoft Help Workshop. 

	Tested using HTML Help Workshop 4.74.8702

	Note: Update source/conf.py to use the classic theme.

-  To generate PDF file, Install MiKTeX (https://miktex.org/download) - Tested using MiKTeX 23.4

	buildlatex.bat

	cd build/latex

	pdflatex Ring.tex

	makeindex Ring -s python.ist

	pdflatex Ring.tex

	