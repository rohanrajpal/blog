---
layout: post
title:  "Paper Summary: AET vs. AED: Unsupervised Representation Learning by Auto-Encoding
Transformations rather than Data"
categories: ["Paper Summary"]
image: /images/paper-summary/aet-vs-aed.png
comments: true
---

> Zhang, Liheng, et al. "Aet vs. aed: Unsupervised representation learning by auto-encoding transformations rather than data." Proceedings of the IEEE Conference on Computer Vision and Pattern Recognition. 2019.  

Deep Learning has had phenomenal success in computer vision tasks. However, one requires a large amount of labelled data to extract good enough representations. That is why its challenging to use Deep Learning with a short amount of labelled data. However, there has been recent research using unsupervised methods to develop representations of data.  

Till date, the methods in unsupervised representation learning try to Auto Encode Data (AED). This paper explores the dynamics of feature representations under different transformations by Auto Encoding Transformations (AET) instead of data. They realise that as long as an unsupervised model learns sufficiently informative representations of the original and the transformed image, a model can decode the transformation.

![]({{ site.baseurl }}/images/paper-summary/aet-vs-aed.png)

They present an AET paradigm which allows us to instantiate a wide range of operators which include parameterised, non-parameterized and GAN-induced transformations. AET achieves state-of-the-art performances on Imagenet, CIFAR-10 and Places dataset. Additionally, its results demonstrate an accuracy close to the cap set by its supervised counterparts. Further analysis of AET loss with accuracy and error plots reveals predictions of transformations are a good indicator for better classification results.  

In their method, they predict the transformation from the representations of the original and transformed image. To predict parametric transformations, they use a loss function based on the difference of the parameters of the transformation. For GAN-Induced transformations, they calculate the difference between the noise parameters for the loss function. Finally, for non-parametric transformations, they measure the average distance between the transformations and the randomly sampled images.  

To evaluate the model, they build a classifier on top of the architecture they use for a dataset. They test their model on the CIFAR-10, Imagenet and the Places dataset. In the CIFAR-10 experiment, they adopt a Network in Network (NIN) architecture which they train by SGD with a composition of transformations. For classification, they use a model-based and a model-free classifier. For the model-based classifier, they build a non-linear classifier with three FC layers. The model-free classifier is a KNN classifier based on the average pooled features from the second convolutional block. The AET outperforms all the other unsupervised methods. Additionally, with the convolutional classifier, AET performs almost similar to fully supervised NIN architecture. However, a direct comparison between AET and other experiments is difficult, as other methods have different architectures and hyperparameters. In the Imagenet dataset, they take two AlexNet branches with its 1000-way linear classifier. They achieve the best results among the other unsupervised models. In the places dataset, they assess the generalisability of their representations by using the previous architecture pretrained on Imagenet. They achieve the best results except in a few scenarios.  

Although AET gets impressive results, the motivation to encode transformations instead of data isn't clear and scattered throughout the paper. Also, all of their results are based on parametric transformations because they couldn't get as good results with other operators. However, they couldn't concretise on why other transformations didn't work well.
The paper presents an excellent motivation to improve unsupervised methods of learning. They explain their methods and evaluations in-detail and use ablations to find out the exact reasons. Along with the advantages, they also highlight the drawbacks of their approach, providing a balanced view. However, it was hard to understand the motivation to learn transformations instead of data. Bringing together the motivation for transformations in the introduction would have explained their approach better.  
