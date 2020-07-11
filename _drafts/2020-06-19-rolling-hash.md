---
layout: post
title:  "Rolling Hashes: Robin Karp Algorithm"
comments: true
---
# Let's find duplicates in a string

How do you find duplicates of length k in a substring?

- Take a substring from i to i+k
- Add it to a hashmap
- In future if you find the same string, it's a match!

```c++

string findDuplicate(string& S,int k){
    unordered_map<string,int> umap;
    for(int i=0;i<S.size()-k+1;i++){
        string temp = S.substr(i,k);
        if(umap[temp]) return temp;
        umap[temp] = 1;
    }
    return "";
}
```

What do you think is the time complexity of this approach? For each iteration you are creating a copy of length k, additionally each time the hash is computed, it takes k operations to compute the hash, hence O(n*k)

## The Robin Karp algorithm

We are just using a sliding window approach here, so why not just add the new letter to the hash and subtract the letter the window just left.

For simplicity lets just have 26 lowercase letters in the array.

```c++
    int prime = INT_MAX / 26 / 26 * 26 - 1;
    vector<int> power;
    for(int i=1;i<S.size();i++)
        power[i] = (power[i-1]*26)%prime;
    string findDuplicate(string& S,int k){
        unordered_map<int,vector<int>> umap;
        long long cur = 0;
        
        for(int i=0;i<k;i++){
            cur = ((cur*26)%prime + (S[i]-'a'))%prime;
        }
        // cout<<k<<"\n";
        umap[cur] = vector<int>(1,0);
        // cout<<cur<<"\n";
        for(int i=k;i<S.size();i++){
            cur = (cur - (power[k-1] * (S[i-k]-'a'))%prime + prime)%prime;
            cur = ((cur*26)%prime + (S[i] - 'a'))%prime;
            // cout<<cur<<"\n";
            // string temp = S.substr(i,k);
            // cout<<temp<<" "<<k<<" "<<i<<"\n";
            if(umap.find(cur)!=umap.end()) {
                for(auto& it:umap[cur])
                    if(S.substr(i-k+1,k)==S.substr(it,k))
                        return S.substr(it,k);
                umap[cur].push_back(i-k+1);
                // cout<<"clash\n";
            }
            else
                umap[cur] = vector<int>(1,i-k+1);
        }
        // cout<<k<<"\n";
        return "";
    }
```