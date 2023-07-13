Toolbox and algorithm used in this paper:


1、MatlabBGL provides robust and efficient graph algorithms for Matlab using native data structures. 
   https://cn.mathworks.com/matlabcentral/fileexchange?term=MatlabBGL

2、gaimc : Graph Algorithms In Matlab Code
   version 1.0 (650 KB) by David Gleich

   Efficient pure-Matlab implementations of graph algorithms to complement MatlabBGL's mex functions.

3、dataset come from: http://www.moleculardescriptors.eu/dataset/dataset.htm
   
   The format of the data is .hin, you need to creat a .bat file to convert .hin to .tex. In the .bat file, there is only one line: ren *.HIN *.txt
   Then,the .txt file can be read into Matlab.
