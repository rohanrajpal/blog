---
layout: post
title:  "Competitive Programming: C++ Cheat Sheet"
toc: true
comments: true
categories: ["Competitive Programming"]
---
Syntax and tricks for C++.
# Improve speed

## Leetcode
```c++
static int fastio = []() {
    std::ios::sync_with_stdio(false);
    std::cin.tie(NULL);
    std::cout.tie(0);
    return 0;
}();
```
## Normal compile
```c++
#define fast ios_base::sync_with_stdio(false),cin.tie(NULL)
```
# Header Template
```c++
#include<bits/stdc++.h>
#define ll long long
#define ld long double
#define vll vector<ll>
#define vii vector<int>
#define vvll vector< vll >
#define pll pair<ll ,ll >
#define MOD 1000000007
#define rall(v) v.rbegin(),v.rend()
#define fst first
#define mp make_pair
#define pb push_back
#define fast ios_base::sync_with_stdio(false),cin.tie(NULL)
#define int long long
#define endl "\n"

#define all(v) v.begin(),v.end()
#define scd second
#define for1(i,n) for(ll (i) = 1 ; (i) <= (n) ; ++(i))
#define forr(i,n) for(ll (i) = (n)-1 ; (i)>=0 ; --(i))
 
#define forn(i,n) for(ll (i) = 0 ; (i) < (n) ; ++(i))
#define forab(i,a,b,c) for(ll (i) = a ; (i) <= (b) ; (i)+=(c))

#define mst(A) memset( (A) , 0 , sizeof(A) );
#define tc() int t; cin >> t ; while (t--)

using namespace std;
```
# Comparators

```c++
class Solution {
public:
    
    int twoCitySchedCost(vector<vector<int>>& costs) {
        sort(costs.begin(),costs.end(),[](auto &i1,auto &i2) -> bool {return i1[0] - i1[1] < i2[0] - i2[1];});
        int sum=0;
        for(int i=0;i<costs.size()/2;i++){
            sum += costs[i][0] + costs[costs.size()-1-i][1];
        }
        return sum;
    }
};
```