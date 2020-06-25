---
layout: post
title:  "Competitive Programming: Problems and Tricks on various concepts."
toc: true
comments: true
categories: ["Competitive Programming"]
---

In this blog I'll document all the challenging competitive programming problems with the focus on *motivation* rather than the solution.

# 5 Problem Solving Tips for Cracking Coding Interview Questions [[Youtube](https://www.youtube.com/watch?v=GBuHSRDGZBY)] 
Tip #1: Come up with a brute-force solution -  
Tip #2: Think of a simpler version of the problem -  
Tip #3: Think with simpler examples -> try noticing a pattern -  
Tip #4: Use some visualization -  
Tip #5: Test your solution on a few examples -  

# Study Plan

[Leetcode top interview questions](https://leetcode.com/explore/interview/card/top-interview-questions-medium/)  
Generic preparation tips I give to freshers to clear any algorithmic interview anywhere:   
1) Data Structures and Algorithms (online course on NPTEL by Naveen Garg)  
2) Analysis and Design of Algorithms (online course on Coursera by Tim Roughgarden, part 1 and part 2  
3) 1 programming language, everything about it including inbuilt things like maps, binary search, sort, stacks, priority queues, vectors / lists, pairs etc  
4) all Codeforces contests from now till interviews  
5) 200+ Leetcode questions  

Take competitive programming course if you haven't done that already.
  

# Best of the best blogs

- [Yash girdhar](https://medium.com/@yashgirdhar/11-companies-55-interviews-9-offers-including-google-and-amazon-heres-what-i-have-to-share-293852c1c98f)
    - Good plan of how to prepare
- [Abinav Bhardwaj](https://medium.com/codealchemist/how-to-prepare-for-campus-placements-b9fa571d45e6)
    - Screenshots of contests of various company contests
- [A sheet of leetcode probs]()
- [Resources by google](https://techdevguide.withgoogle.com/?_ga=2.120392461.486813392.1576836508-1967957252.1576836508)
- [Five Essential Phone Screen Questions by Steve Yegge](https://sites.google.com/site/steveyegge2/five-essential-phone-screen-questionshttps://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions)
- [How to: Work at Google — Candidate Coaching Session for Technical Interviewing](https://www.youtube.com/watch?v=oWbUtlUhwa8&feature=youtu.be)
- [How To Get Hired -- What CS Students Need to Know](http://www.kegel.com/academy/getting-hired.html)
- [Topcoder tutorials](https://www.topcoder.com/community/competitive-programming/tutorials/)
- [Google resource](https://docs.google.com/presentation/d/1_6c6eu1oaDcJeKGcu43wtal8OeFNL6xMmmoSiDt9l5A/edit#slide=id.g3b1a8a6735_157_5)

# Array

## Remove Duplicates from Sorted Array
[Leetcode](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/727/)

The question is interesting because you have to ensure the array is modified, too, not just return the answer.

```
class Solution {
public:
    int removeDuplicates(vector<int>& nums) {
        int j=!nums.empty();
        for(int i=1;i<nums.size();i++){
            if(nums[i]>nums[j-1]){
                nums[j++]=nums[i];
            }
        }
        return j;
    }
};
```

# Dynamic Programming
A smart brute force and your algorithm goes from cubic to linear complexity. That's dynamic programming.

## Coin Change 2 
[Leetcode](https://leetcode.com/problems/coin-change-2/)

We can use a coin infinite number of times, but how many times do we *need*?  
We know that the amounts a coin can make, so why not just store the count of the amount that we have made? Out of all the possible amount, if you add that value to 

Say we have used a part of the array to build our answer, now we come across a new coin:
For a coin of value c, if previously we had n number of ways to make vaulue i-c, in how many ways can we make i? ways[i-c] + already existing ways to make i.  

```c++
class Solution {
public:
    int change(int amount, vector<int>& coins) {
        vector<int> dp(amount+1);
        dp[0] =1;
        for(auto& coin: coins){
            for(int i=coin;i<=amount;i++)
                dp[i] += dp[i-coin];
        }
        return dp[amount];
    }
};
```

## Dungeon Game 
[Leetcode](https://leetcode.com/problems/dungeon-game/)
Mistakes I made: please dry run before coding

Notice that the minimum initial health will be at least 1 even if we have an example like [1,0,0].

When we reach the queen, say value in that cell is -3, so we must have 1-(-2) health to save the queen. The minimum initial length at the bottom right should be `max(1,1-dungeon[i][j])`.

Now at any i,j, if we need 3 points of health for future, we will add requirements of health for current i,j, so health will be 3 - (-4). We should have `max(1,min(dp[i+1][j],dp[i][j+1])-dungeon[i][j])` health.

Top down DP (Easier to understand)
```c++
class Solution {
public:
    int m,n;
    int calculateMinimumHP(vector<vector<int>>& dungeon) {
        m = dungeon.size();n=dungeon[0].size();
        vector<vector<int>> dp(m,vector<int>(n,0));
        return calcMin(dungeon,dp,0,0);
    }
    int calcMin(vector<vector<int>>& dungeon, vector<vector<int>>& dp, int i, int j){
        if(i>=m or j>=n) return INT_MAX;
        if(i==m-1 and j==n-1) return max(1,1 - dungeon[i][j]);
        if(dp[i][j]) return dp[i][j];
        return dp[i][j] = max(1,min(calcMin(dungeon,dp,i,j+1),calcMin(dungeon,dp,i+1,j)) - dungeon[i][j]);
    }
};
```
Bottom up DP (Space optimized)
We dont really need to make an extra array when doing bottom up.
```c++
class Solution {
public:
    int calculateMinimumHP(vector<vector<int>>& dungeon) {
        int m=dungeon.size(),n=dungeon[0].size();
        for(int i=m-1;i>=0;i--)
            for(int j=n-1;j>=0;j--)
                if(i==m-1 and j==n-1)
                    dungeon[i][j] = max(1,1-dungeon[i][j]);
                else if(i==m-1)
                    dungeon[i][j] = max(1,dungeon[i][j+1]-dungeon[i][j]);
                else if(j==n-1)
                    dungeon[i][j] = max(1,dungeon[i+1][j]-dungeon[i][j]);
                else
                    dungeon[i][j] = max(1,min(dungeon[i][j+1],dungeon[i+1][j])-dungeon[i][j]);
        return dungeon[0][0];
    }
};
```

# Maths

## Permutation Sequence
[Leetcode](https://leetcode.com/problems/permutation-sequence/) | [Solution Reference](https://leetcode.com/problems/permutation-sequence/discuss/22507/%22Explain-like-I'm-five%22-Java-Solution-in-O(n))

C++ has an inbuilt function `next_permuation`
```c++
class Solution {
public:
    string getPermutation(int n, int k) {
        string seq="";
        for(int i=1;i<=n;i++)
            seq+=('1'+i-1);
        while(--k>0)
            next_permutation(seq.begin(),seq.end());
        return seq;
    }
};
```
Complexity: O(k)

Can we do better? Absolutely!  
Let's take n=4; the permutations will be
```
1 - (2,3,4)
    (2,4,3)
    ...
2 - (1,4,3)
    ...
3 - (1,2,4)
    ...
4 - (1,2,3)
    ...
```
On removing the first index, the rest of the permutations are repeating. If we want to find the 22nd permutation. The first index will be `k/(n-1)! = 21 / (4-1)! = 21 / 3! =  3`. 3rd index of `[1,2,3,4]` is 4. So the first number would be 4.  
The permutation till here is "4"  
Now how do we find the index in the remaining combinations? Before the index, we have covered `index*(n-1)!` permutations. Subtracting this from k will give us the index for the new sub problem
`k = k % (n-1) = 21 % (4-1)! = 21 - 18 = 3`
We also remove 4 from the set now. Set is now 
```
1 - (2,3)
    (3,2)
2 - (3,1)
    ...
3 - (1,2)
    (2,1)
```
`index = 3 / (n-2)! = 3 / 2! = 1` Now the index at 1 in `[1, 2, 3]` is 2.
Permutation now is "42"
Left out set is `[1 , 3]`
`k = 3 % 2! = 1`
`index = 1 / 1! = 1`. Elem at 1 is 3, permutation is "423"
Finally, `k = 1 - 1*0! = 0`
Adding the left-out element
perm is finally = "4231"

```c++
class Solution {
public:
    string getPermutation(int n, int k) {
        string seq="";k--;
        vector<int> nums,fact(n+1,1);
        
        for(int i=1;i<=n;i++) nums.push_back(i);
        for(int i=1;i<=n;i++) fact[i] = fact[i-1]*i;
        
        for(;n>0;n--){
            int idx = k / fact[n-1];
            seq += (nums[idx]-1) + '1';
            k %= fact[n-1];
            nums.erase(nums.begin()+idx);
        }
        return seq;
    }
};
```
## Single Number (XOR)
[Leetcode link](https://leetcode.com/problems/single-number/)

If we XOR a number with itself, it nulls out. So XOR all the numbers in the array and voila!

```c++
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int ans=0;
        
        for(int &i:nums){
            ans ^= i;
        }
        
        return ans;
    }
};
```
## Single Number II (Bit Manipulation)
[Leetcode](https://leetcode.com/problems/single-number-ii/) |
[Solution reference](https://leetcode.com/problems/single-number-ii/discuss/43295/Detailed-explanation-and-generalization-of-the-bitwise-operation-method-for-single-numbers)

Of course we can use a dictionary, but can we do it in constant memory? We can, but it's not that straightforward.  

We'll have to think of integers in terms of bits to solve this problem.

Aim: Develop a counter which
- Resets after k elements
- Counter should be unaffected by 0
- It should increment by 1 if it sees one

```c++
class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int x1=0,x2=0,mask;
        for(int i=0;i<nums.size();i++){
            x2 ^= x1 & nums[i];
            x1 ^= nums[i];
            mask = ~(x1 & x2);
            x1 &= mask;
            x2 &= mask;
        }
        return x1;
    }
};
```

# Graphs

## Cheapest Flights Within K Stops (Dijkstra)

We can take the Dijkstra algorithm and modify it so that distances greater than k hops will not be considered.  
```c++
#define INF 0x3f3f3f3f
class Point 
{ 
    public:
    int node; 
    int dist;
    int hops;
    Point(int a, int b, int c){
        node=a;dist=b;hops=c;
    }
};
class myComparator 
{ 
public: 
    int operator() (const Point& p1, const Point& p2) 
    { 
        return p1.dist > p2.dist; 
    }
};
class Solution {
public:
    int findCheapestPrice(int n, vector<vector<int>>& flights, int src, int dst, int K) {
        if(flights.size()==0 or n==0) return -1;
        vector<vector<pair<int,int>>> adj(n,vector<pair<int,int>>(0));
        
        for(int i=0;i<flights.size();i++){
            adj[flights[i][0]].push_back(make_pair(flights[i][1],flights[i][2]));
        }
        
        priority_queue <Point, vector<Point>, myComparator> pq;
        
        pq.push(Point(src,0,0));
        vector<int> dist(n,INF);
        dist[src]=0;
        
        while(!pq.empty()){
            Point cur = pq.top();
            pq.pop();
            if(cur.node == dst)
                return cur.dist;
            if(cur.hops > K)
                continue;
            
            for(int i=0;i<adj[cur.node].size();i++)
                if(dist[adj[cur.node][i].first] > cur.dist+adj[cur.node][i].second)
                    pq.push(Point(adj[cur.node][i].first,cur.dist+adj[cur.node][i].second,cur.hops+1));
        }
        
        return -1;
    }
};
```
# Tree

##   Count Complete Tree Nodes

[Leetcode link](https://leetcode.com/explore/challenge/card/june-leetcoding-challenge/542/week-4-june-22nd-june-28th/3369/)
```c++
class Solution {
public:
    int countNodes(TreeNode* root) {
        int height = findHeight(root);
        return height< 0? 0: \
            findHeight(root->right)==height-1? \
            (1<<height) + countNodes(root->right):(1<<(height-1)) + countNodes(root->left);
    }
    int findHeight(TreeNode* node){
        return node==NULL?-1 : 1+findHeight(node->left);
    }
};
```

# Binary Search

## Longest Duplicate Substring (Rolling Hashes)
[Leetcode link](https://leetcode.com/problems/longest-duplicate-substring/)

- Do a binary search on length
    - Have the least length as 0 and highest as n-1
    - Take the mid-length, if you find a duplicate, try for a bigger length
    - If not, try for a smaller length

- Sliding window (Robin Karp)
    - Have a look at the [rolling hash](link something) approach

- [robin karp solution](https://leetcode.com/problems/longest-duplicate-substring/discuss/291048/C%2B%2B-solution-using-Rabin-Karp-and-binary-search-with-detailed-explaination)
- [c++ 17 solution](https://leetcode.com/problems/longest-duplicate-substring/discuss/695101/C%2B%2B-short-O(n-log(n))-solution-with-std%3A%3Aunordered_setlessstd%3A%3Astring_viewgreater)

