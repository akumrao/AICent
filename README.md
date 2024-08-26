# classificatgion with mobilenet_v2 && object detection with YOLOX using TensorFlow Lite over Android with TPU and GPU

Figure 1. System architecture for Android Neural Networks API

![00_doc/nnapi_architecture.png](00_doc/nnapi_architecture.png)]


# It Contain packages
1. OpenCV 

2. TensorLite


## How to Run

cd AICent

adb root

adb shell setenforce 0

adb shell settings put global verifier_verify_adb_installs 0

adb install tpu***.apk

# To push model to Mobile

adb push resource  /storage/emulated/0/Android/data/com.aicent.tpu/files/Documents


## Test case TPU-001 - TPU-004

The requirements for more fast, low-latency machine learning increases, so does the need for more accessible and on-device solutions capable of performing well on the so-called "edge." It is Edge TPU architecture currently available on the Google Pixel 4 mobile phone, and The Android Neural Networks API (NNAPI), an API designed for executing machine learning operations on Android devices.

In this demo, I will show how I modified the TensorFlow Lite Object Detection demo for Android to use an Edge TPU optimized model running under the NNAPI on a Pixel 10. Additionally, I want to present the changes I did to log the prediction latencies and compare those done using the default TensorFlow Lite API and the NNAPI. But before that, let me give a brief overview of the terms I've introduced so far.

The Edge TPU, however, is not an overall accelerator for all kinds of machine learning. The hardware is designed to improve forward-pass operations, meaning that it excels as an inference engine and not as a tool for training. That's why you will mostly find applications where the model used on the device, was trained somewhere else.

On the software side of things, we have the NNAPI. This Android API, written in C, provides acceleration for TensorFlow Lite models on devices that employ hardware accelerators such as the TPU and GPUs. The TensorFlow Lite framework for Android includes an NNAPI delegate, so don't worry, we won't write any C code.


# The model
The model we will use for this project is the float32 version of the MobileDet object detection model optimized for the Edge TPU and trained on the COCO dataset (link). 
This collection of images has over 200k labeled images separated across 90 classes that include "bird, "cat," "person," and "car."




## Google's IP: Tensor TPU and GPU statistics
Inference per seconds, higher is better

Image Classification 942

Object Detection 461

Language processing ??(TBD)

Geek bench with GPU  1385 ( score)


## Tensorflow lite build process

https://www.tensorflow.org/lite/guide/build_cmake

https://juandes.com/pixel-nnapi/