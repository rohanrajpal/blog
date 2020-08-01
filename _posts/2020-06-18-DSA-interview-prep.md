---
layout: post
title:  "DSA Interview Prep Resources"
toc: true
comments: true
categories: ["Interview"]
---
In this blog I'll document some resources and all the challenging competitive programming problems with the focus on *motivation* rather than the solution.

## 5 Problem Solving Tips for Cracking Coding Interview Questions

[Youtube](https://www.youtube.com/watch?v=GBuHSRDGZBY)]  
Tip #1: Come up with a brute-force solution -  
Tip #2: Think of a simpler version of the problem -  
Tip #3: Think with simpler examples -> try noticing a pattern -  
Tip #4: Use some visualization -  
Tip #5: Test your solution on a few examples -  

## Study Plan

[Leetcode top interview questions](https://leetcode.com/explore/interview/card/top-interview-questions-medium/)  
Generic preparation tips I give to freshers to clear any algorithmic interview anywhere:   

1) Data Structures and Algorithms (online course on NPTEL by Naveen Garg)  
2) Analysis and Design of Algorithms (online course on Coursera by Tim Roughgarden, part 1 and part 2  
3) 1 programming language, everything about it including inbuilt things like maps, binary search, sort, stacks, priority queues, vectors / lists, pairs etc  
4) all Codeforces contests from now till interviews  
5) 200+ Leetcode questions  

Take the competitive programming course if you haven't done that already.
  
## Best of the best blogs

- [Yash girdhar](https://medium.com/@yashgirdhar/11-companies-55-interviews-9-offers-including-google-and-amazon-heres-what-i-have-to-share-293852c1c98f)
  - Good plan of how to prepare
- [Abinav Bhardwaj](https://medium.com/codealchemist/how-to-prepare-for-campus-placements-b9fa571d45e6)
  - Screenshots of contests of various company contests
<!-- - [A sheet of leetcode probs]() -->
- [Resources by google](https://techdevguide.withgoogle.com/?_ga=2.120392461.486813392.1576836508-1967957252.1576836508)
- [Five Essential Phone Screen Questions by Steve Yegge](https://sites.google.com/site/steveyegge2/five-essential-phone-screen-questionshttps://sites.google.com/site/steveyegge2/five-essential-phone-screen-questions)
- [How to: Work at Google — Candidate Coaching Session for Technical Interviewing](https://www.youtube.com/watch?v=oWbUtlUhwa8&feature=youtu.be)
- [How To Get Hired -- What CS Students Need to Know](http://www.kegel.com/academy/getting-hired.html)
- [Topcoder tutorials](https://www.topcoder.com/community/competitive-programming/tutorials/)
<!-- [Google resource](https://docs.google.com/presentation/d/1_6c6eu1oaDcJeKGcu43wtal8OeFNL6xMmmoSiDt9l5A/edit#slide=id.g3b1a8a6735_157_5) -->

## TLE reasons

- does not satisfy constraints
- infinite loop in code
- created an endless linked list and returned it

## Array

### Remove Duplicates from Sorted Array

[Leetcode](https://leetcode.com/explore/interview/card/top-interview-questions-easy/92/array/727/)

The question is interesting because you have to ensure the array is modified, too, not just return the answer.

```c++
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

## 3Sum

[Leet link](https://leetcode.com/explore/interview/card/top-interview-questions-medium/103/array-and-strings/776/)

```c++
class Solution {
public:
    vector<vector<int>> threeSum(vector<int>& nums) {
        vector<vector<int>> ans;
        sort(nums.begin(),nums.end());
        for(int i=0;i<nums.size();i++){
            int front=i+1,back=nums.size()-1,target=-nums[i];
            // cout<<"in\n";
            while(front<back){
                // cout<<front<<" "<<back<<"\n";
                int sum = nums[front]+nums[back];

                if(sum<target)
                    front++;
                else if(sum>target)
                    back--;
                else{
                    // cout<<"ansadd\n";
                    vector<int> elem = {nums[i],nums[front],nums[back]};
                    ans.push_back(elem);
                    front++;
                    back--;
                    //find duplicates of idx 1
                    while(front<back and nums[front] == nums[front-1]) front++;
                    //find duplicates of idx 2
                    while(front<back and nums[back] == nums[back+1]) back--;
                }
            }

            while(i+1 < nums.size() and nums[i]==nums[i+1]) i++;
        }
        return ans;
    }
};
```

### Set Matrix Zeroes

[Leetcode Solution](https://leetcode.com/explore/interview/card/top-interview-questions-medium/103/array-and-strings/777/) | [Solution](https://leetcode.com/explore/interview/card/top-interview-questions-medium/103/array-and-strings/777/discuss/26014/Any-shorter-O(1)-space-solution)

Brute approach: Just store an alternative matrix that would store whether the i,j element should be zero or not. This is O(mxn) space solution.

Brute space efficient approach: For each arr[i][j] which is zero, go through the row and column and mark it zero with a flag. Might not work if the constraints are full integer.

O(m+n) approach: Have some state array for row and column, which tells whether i and j is 0.

O(1) approach: We have though of the O(m+n) approach, how about we just store those states in the 2d array itself?

```c++
class Solution {
public:
    void setZeroes(vector<vector<int>>& matrix) {
        int m=matrix.size(),n=matrix[0].size(),col=1;
        for(int i=0;i<m;i++){
            if(matrix[i][0]==0) col=0;
            for(int j=1;j<n;j++)
                if(matrix[i][j]==0)
                    matrix[0][j] = matrix[i][0] = 0;
        }
        for(int i=m-1;i>=0;i--){
            for(int j=n-1;j>=1;j--)
                if(matrix[0][j]==0 or matrix[i][0]==0)
                    matrix[i][j]=0;
            if(col==0) matrix[i][0]=0;
        }
    }
};
```

## Dynamic Programming

A smart brute force and your algorithm goes from cubic to linear complexity. That's dynamic programming.

### Coin Change 2

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

### Dungeon Game

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

### Distinct Subsequences

[Leetcode Questions](https://leetcode.com/problems/distinct-subsequences/)

## Strings

### Longest Substring Without Repeating Characters

[Leetcode link](https://leetcode.com/explore/interview/card/top-interview-questions-medium/103/array-and-strings/779)
Redundant step: no need to clear previous dictionary values, just update the start

```c++
class Solution {
public:
    int lengthOfLongestSubstring(string s) {
        int start=-1,maxlen=0;
        unordered_map<char,int> umap;
        for(int i=0;i<s.size();i++){
            if(umap.count(s[i])!=0){
                start=max(start,umap[s[i]]);
            }
            umap[s[i]]=i;
            if(maxlen<i-start) maxlen=i-start;
        }
        return maxlen;
    }
};
```

## Maths

### Permutation Sequence

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

```text
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

```text
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

### Number of 1 Bits

[Leetcode link](https://leetcode.com/explore/interview/card/top-interview-questions-easy/99/others/565)
A nice trick to avoid going through zeros as well.

```c++
class Solution {
public:
    int hammingWeight(uint32_t n) {
        int count=0;
        while(n){
            count+=1;
            n=n&(n-1);
        }
        return count;
    }
};
```

## Graphs

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

## Tree

### Count Complete Tree Nodes

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

## Binary Search

### Longest Duplicate Substring (Rolling Hashes)

[Leetcode link](https://leetcode.com/problems/longest-duplicate-substring/)

- Do a binary search on length
  - Have the least length as 0 and highest as n-1
  - Take the mid-length, if you find a duplicate, try for a bigger length
  - If not, try for a smaller length

- Sliding window (Robin Karp)
  - Have a look at the [rolling hash](link something) approach

- [robin karp solution](https://leetcode.com/problems/longest-duplicate-substring/discuss/291048/C%2B%2B-solution-using-Rabin-Karp-and-binary-search-with-detailed-explaination)
- [c++ 17 solution](https://leetcode.com/problems/longest-duplicate-substring/discuss/695101/C%2B%2B-short-O(n-log(n))-solution-with-std%3A%3Aunordered_setlessstd%3A%3Astring_viewgreater)

## Backtracking

```text
The way I think of backtracking is as follows:

1. Make a change
2. Recurse
3. Undo the change

If at any point we reach the goal state, return true/print/whatever.

- So for the sudoku problem: For all possible squares on the board see if we can add any value between 1-9. If we can, add the value and recurse for the rest of the board. Then undo the changes by making the board blank again. Goal state is when we have successfully filled in last square

- For n queens: Iterate through the first row. If we can place a queen at a given column place it and recurse for the remaining rows. Then undo the change by removing the queen and moving to the next column. Goal is when we have placed queen on nth row

- Print all possible permutations: Initialize an empty String for results. In the input string iterate through each character. For each character, remove it from input and add it to result and recurse. Then remove the character from result and insert it back in same position in input string. Goal is when result size = n.

- Given n print all sets of valid parentheses that amount to n: Start with blank input string and 2 numbers i, j initialized to n that denote number of opening/closing parentheses remaining - you can add opening parentheses to the string if i>0. You can add closing parentheses if j>i. If you can add opening parentheses, add it to stringbuilder, recurse and then remove it from end of stringbuilder. If you can add closing parentheses add it to stringbuilder, recurse and then remove it from end of stringbuilder. Goal is when both i, j =0.


- Print all subsets of a set: For each character in set, remove it from input set add it to result set and if it has not been printed already, print (goal is any set that has not been printed already). Then recurse for remaining elements. Then remove element from result set and add it back to input set.


Pretty much all the backtracking problems I have done follows this pattern.
```

### Letter Combinations of a Phone Number

[Leetcode link](https://leetcode.com/explore/interview/card/top-interview-questions-medium/109/backtracking/793/)

```c++
class Solution {
public:
    vector<string> nmap = {"","","abc","def","ghi","jkl","mno","pqrs","tuv","wxyz"};
    vector<string> ans;
    vector<string> letterCombinations(string digits) {
        if(digits.size()==0) return ans;
        makeComb(digits,0,"");
        return ans;
    }
    void makeComb(string& digits, int i, string comb){
        if(i==digits.size()) {
            ans.push_back(comb);
            return;
        }
        for(char ch:nmap[digits[i]-'0'])
            makeComb(digits,i+1,comb+ch);
    }
};
```

### Generate Parentheses

[Leetcode link](https://leetcode.com/explore/interview/card/top-interview-questions-medium/109/backtracking/794)  

What would be a brute force solution here? Try all 2^n combinations and check if they are valid or not.

A better way would be to instead construct only those parentheses which are valid. Now when is a parentheses valid? When we have more '(' than ').' So lets construct from the left and only add ')' when their number is less than '('

Bonus: change the string you're making in place to save space and time.

```c++
class Solution {
public:
    vector<string> generateParenthesis(int n) {
        int m=n;
        vector<string> res;
        string s="";
        genP(n,0,0,res,s);
        return res;
    }
    void genP(int n, int open, int close, vector<string> &res, string &s){
        if(open==n and close==n) {
            res.push_back(s);
            return;
        }
        s.push_back('(');
        if(open<n) genP(n,open+1,close,res,s);
        s.pop_back();
        s.push_back(')');
        if(close<open) genP(n,open,close+1,res,s);
        s.pop_back();
    }
};
```

## Linked List

### Add two Numbers

Make a new linked list and store the results into that. 

```c++
class Solution {
public:
    ListNode* addTwoNumbers(ListNode* l1, ListNode* l2) {
        int c=0;
        ListNode *root=new ListNode(),*node=root;
        while(l1 || l2 || c){
            if(l1) c+=l1->val,l1=l1->next;
            if(l2) c+=l2->val,l2=l2->next;
            node->next = new ListNode(c%10);
            c /= 10;
            node = node->next;
        }
        return root->next;
    }
};
```

### Odd-Even Linked List

[Leetcode](https://leetcode.com/explore/interview/card/top-interview-questions-medium/107/linked-list/784/)

Doing this problem in place is quite interesting. Since we want to separate out odd and even groups lets just maintain different pointers? In the end we shall link the lists.

```c++
class Solution {
public:
    ListNode* oddEvenList(ListNode* head) {
        if(head==nullptr) return head;
        ListNode *even=head->next,*evenHead=head->next,*odd=head;
        while(even!= nullptr and even->next!=nullptr){
            odd->next = odd->next->next;
            even->next = even->next->next;
            odd = odd->next;
            even = even->next;
        }
        odd->next = evenHead;
        return head;
    }
};
```

### Intersection of Two Linked Lists

[Leetcode](https://leetcode.com/explore/interview/card/top-interview-questions-medium/107/linked-list/785/)

A simple solution would be to calculate the difference between their lengths and adjust the position of the pointers.

Can we do it without calculating the lengths? Well yes. Let's say the length of A is a+c and of B is b+c. 
Lets say that A has covered a+c length, B has covered b+c length. They both shall meet when they have the same distance covered, so if the pointer of A goes to the head of B and same for the other, then both will cover a+c+b and b+c+a distance. They will meet at the intersection now.

```c++
class Solution {
public:
    ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
        
        ListNode *a=headA,*b=headB;
        while(a!=b){
            a = a==nullptr ? headB : a->next;
            b = b==nullptr ? headA : b->next;
        }
        
        return a;
    }
};
```

## Bit Manipulation

### Single Number

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

### Single Number II

[Leetcode](https://leetcode.com/problems/single-number-ii/) |
[Solution reference](https://leetcode.com/problems/single-number-ii/discuss/43295/Detailed-explanation-and-generalization-of-the-bitwise-operation-method-for-single-numbers)

Of course we can use a dictionary, but can we do it in constant memory? We can, but it's not that straightforward.  

We'll have to think of integers in terms of bits to solve this problem.

Aim: Develop a counter which

- Resets after k elements
- The counter should be unaffected by 0
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

## Sum of Two Integers

Let's take two numbers, 5 and 7. In base two, they'll look like

5 - 101  
7 - 111

Now there are two basic things we keep in mind

- how to add numbers?
- how to take care of carry?

Now we cant use + or -, so we need to figure out an operator which would yield one with 1 and 0, but 0 with both 1 or both 0. The XOR gate nicely handles this case.

Carry only happens when both digits being added are 1. A good old AND gate will handle this case for us.

Now instead of conventionally adding and using carry together, why not simply add the numbers without carry, calculate the carry with the AND gate, shift it to the left, and then add that to the XOR result.

**Take care of negative values**: We try to represent negative vaules as unsigned int and then right shift, as right shift for negative isnt possible.

```c++
class Solution {
public:
    int getSum(int a, int b) {
        if(a==0) return b;
        return getSum((unsigned int)(a&b)<<1,a^b);
    }
};
```

## My weak points

- cpp string questions
- dynamic programming
- linked lists