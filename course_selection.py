#!/usr/bin/env python
# coding: utf-8
"""
To check if your solution is correct on a set run the following command(s) in terminal 

    python autograder.py -p course -s small
    
    python autograder.py -p course -s large


run separately for each case

If you get an error: Segmentation Fault, run this command:

    ulimit -s unlimited 


"""

import numpy as np
import sys 
sys.setrecursionlimit(100000000)

def course_selection(G,n): # Decide what arguments this function should take
    """
    course_selection function 
    takes as input one test case loaded from the .in file
    returns the solution for the test case (list, or if there's no possible solution return str(IMPOSSIBLE))
    """
    # Write your Solution Here! 
    L_visit = []
    start = {}
    end = {}
    time = 0  

    def DFS_visit(u, time):
        time+=1
        L_visit.append(u)
        start[u] = time

        for v in G[u]:
            if v not in L_visit:
                time = DFS_visit(v, time)

        time += 1
        end[u] = time


        return time

    for u in G:
        if u not in L_visit:
            time = DFS_visit(u, time)

    for u in G:
        for v in G[u]:
            if start[v]<start[u] and end[v]>end[u]:
                return('impossible')
    l=''
    pair=[(end[u],u) for u in range(1,n+1)]
    pair.sort(key=lambda x: x[0], reverse=True)
    for u in pair:
        l=l+' '+ str(u[1])
    return l[1:]
        #print(*result, sep=" ")
        #print(DFS(G[2]))
    #solvePB(3,[(3,2),(3,1)])

    
    #raise NotImplementedError 



def run_code(in_name='data/course_selection_small.in'):
    """
    run_code function 
    takes one argument: the sample file to try
    loads the data and writes the solution to the output file (course_sol.out)
    """
    fin = open(in_name, 'r')                  # Do not change
    fout = open('data/course_sol.out', 'w')        # Do not change

    # Always read using fin and write using fout.
    # You can print for your own debugging purposes. But the autograder does not see the printed values.
    
    s = fin.readline()
    n_tests = int(s)
    for i in range(n_tests):
        s = fin.readline().split()
        n, m = int(s[0]), int(s[1])
        
        #L = [[]]*n                  # DO NOT USE THIS LINE to create adjacency list
        G = {}                       # Please use this code instead.
        L = []
        
        for i in range(1,n+1):
            G[i] = []

        for j in range(m):
            t = fin.readline().split(' ')
            p, q = int(t[0]), int(t[1])
            G[p].append(q)
        output = course_selection(G,n)     # In this case we assume output is one integer.
        # In the course selection problem, the answer is either a list or "impossible"
        # How to adapt your code for this answer.

        #print(output)
        fout.write(str(output)+ '\n')

    fin.close()                    # Do not change
    fout.close()



    #raise NotImplementedError 

