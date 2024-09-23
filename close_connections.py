#!/usr/bin/env python
# coding: utf-8
"""
To check if your solution is correct on a set run the following command(s) in terminal 

    python autograder.py -p connections -s small
    
    python autograder.py -p connections -s large


run separately for each case
"""

import numpy as np



def close_connections(G, s, k): # Decide what arguments this function should take
    """
    even_odd function 
    takes as input one test case 
    returns the solution for the test case (int)
    """
    # Write your Solution Here! 
    
    Q = [(s, 0)]
    count = 0
    n=len(G)
    L_visit = [0]*(n+1)
    #D=[]
    while Q!=[]:
        u, d = Q.pop(0)
        L_visit[u]=1
        #D.append(d)
        if d <= k  :
            count += 1  
        for v in G[u]:
            if L_visit[v]==0 and v not in [q[0] for q in Q] :
                Q.append((v, d + 1))
        #for i in D
    return count
#G = {1: [2], 2: [5,3], 3: [4], 4: [6], 5: [], 6: [6]}

#BFS_connections(G, 2, 2)
    
    
    raise NotImplementedError 



def run_code(in_name='data/connections_small.in'):
    """
    run_code function 
    takes one argument: the sample file to try
    loads the data and writes the solution to the output file (connections_sol.out)
    """
    fin = open(in_name, 'r')                  # Do not change
    fout = open('data/connections_sol.out', 'w')   # Do not change
    
    
    t = fin.readline()
    n_tests = int(t)
    for i in range(n_tests):
        t = fin.readline().split()
        n, m, s, k  = int(t[0]), int(t[1]), int(t[2]), int(t[3])
        
        #L = [[]]*n                  # DO NOT USE THIS LINE to create adjacency list
        G = {}                       # Please use this code instead.
        L = []
        
        for i in range(n):
            G[i+1] = []

        for j in range(m):
            t = fin.readline().split(' ')
            a, b = int(t[0]), int(t[1])
            L.append([a,b])
        #print(L)
            #L[b-1].append(a-1)      # For undirected graphs

        for c in L:
            G[c[0]].append(c[1])
        #print(G)
        output = close_connections(G, s, k)     # In this case we assume output is one integer.
        # In the course selection problem, the answer is either a list or "impossible"
        # How to adapt your code for this answer.
        
        #print(output)
    
    
        fout.write(str(output))
        fout.write('\n')

    fin.close()
    fout.close()

    #raise NotImplementedError 


