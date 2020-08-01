---
layout: post
title:  "Competitive Programming: C++ Cheat Sheet"
toc: true
comments: true
categories: ["Competitive Programming"]
---
Syntax and tricks for C++.

## Improve speed

### Leetcode

```c++
static int fastio = []() {
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(0);
    return 0;
}();
```

### Normal compile

```c++
#define fast ios_base::sync_with_stdio(false),cin.tie(NULL)
```

## Header Template

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

## Comparators

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

## Pointers and Addresses

A pointer stores a memory address.

Some ways to do the same thing

```c++
ListNode *root=new ListNode(),*node=root;
ListNode root,*node=&root;
//node is the same above
```

## Hashmap

### Map of pairs

```c++
struct hash_pair {
    template <class T1, class T2>
    size_t operator()(const pair<T1, T2>& p) const
    {
        auto hash1 = hash<T1>{}(p.first); 
        auto hash2 = hash<T2>{}(p.second); 
        return hash1 ^ hash2; 
    } 
}; 

unordered_map<pair<int, int>, bool, hash_pair> um;
```

### Increase map speed

```c++
umap.reserve(n)
```

### String stuff

int to string

```c++
class Solution {
public:
    vector<string> fizzBuzz(int n) {
        vector<string> ans(n);
        for(int i=1;i<=n;i++){
            if(i%3==0 and i%5==0) ans[i-1]="FizzBuzz";
            else if(i%3==0) ans[i-1]="Fizz";
            else if(i%5==0) ans[i-1]="Buzz";
            else ans[i-1]=to_string(i);
        }
        return ans;
    }
};
```

### Priority Queue

```c++
//max heap
priority_queue <int> g = gq;
//min heap
priority_queue <int, vector<int>, greater<int>> gquiz;
```
