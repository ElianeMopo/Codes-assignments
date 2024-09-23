#!/usr/bin/env python
# coding: utf-8
"""
To check if your solution is correct on a set run the following command(s) in terminal 

    python autograder.py -p even -s small

    python autograder.py -p even -s medium
    
    python autograder.py -p even -s large


run separately for each case
"""

import numpy as np

def even_odd(L): # Decide what arguments you want this to take
    """
    even_odd function 
    takes as input one test case 
    returns the solution for the test case (int)
    """
    # Write your Solution Here! 
    n=len(L)
    c=0
    for i in range(n):
        for j in range(i+1,n):
            if L[i]%2==0:
                if L[j]%2!=0 and L[j]>L[i]:
                    c+=1
    return c                
    #raise NotImplementedError 



def run_code(in_name='data/small_even_odd_inversion.in'):
    """
    run_code function 
    takes one argument: the sample file to try
    loads the data and writes the solution to the output file (even_sol.out)
    """

    fin = open(in_name, 'r')                  # Do not change
    fout = open('data/even_sol.out', 'w')   # Do not change
    number_test=int(fin.readline())
    for i in range(number_test):
        k=fin.readline()
        w=fin.readline().split()
        P=[int(i) for i in w]
        c=even_odd(P)
        fout.write(str(c)+'\n')
    fin.close()
    fout.close()

    #raise NotImplementedError 


