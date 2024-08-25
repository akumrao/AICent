# YOLOX with TensorFlow Lite over Android with TPU

![00_doc/nnapi_architecture.png](00_doc/nnapi_architecture.png)]

## To push model to Mobile  

cd AICent

adb push resource  /storage/emulated/0/Android/data/com.aicent.tpu/files/Documents


## Test case TPU-004

The requirements for more fast, low-latency machine learning increases, so does the need for more accessible and on-device solutions capable of performing well on the so-called "edge." It is Edge TPU architecture currently available on the Google Pixel 4 mobile phone, and The Android Neural Networks API (NNAPI), an API designed for executing machine learning operations on Android devices.

In this demo, I will show how I modified the TensorFlow Lite Object Detection demo for Android to use an Edge TPU optimized model running under the NNAPI on a Pixel 10. Additionally, I want to present the changes I did to log the prediction latencies and compare those done using the default TensorFlow Lite API and the NNAPI. But before that, let me give a brief overview of the terms I've introduced so far.


The Edge TPU, however, is not an overall accelerator for all kinds of machine learning. The hardware is designed to improve forward-pass operations, meaning that it excels as an inference engine and not as a tool for training. That's why you will mostly find applications where the model used on the device, was trained somewhere else.

On the software side of things, we have the NNAPI. This Android API, written in C, provides acceleration for TensorFlow Lite models on devices that employ hardware accelerators such as the Pixel Visual Core and GPUs. The TensorFlow Lite framework for Android includes an NNAPI delegate, so don't worry, we won't write any C code.


Figure 1. System architecture for Android Neural Networks API. Source: https://developer.android.com/ndk/guides/neuralnetworks
The model
The model we will use for this project is the float32 version of the MobileDet object detection model optimized for the Edge TPU and trained on the COCO dataset (link). Let me quickly explain what these terms mean. MobileDet (Xiong et al.) is a very recent state-of-the-art family of lightweight object detection models for low computational power devices like mobile phones. This float32 variant means that it is not a quantized model, a model that has been transformed to reduce its size at the cost of model accuracy. On the other hand, a fully quantized model uses small weights based on 8 bits integers (source). Then, we have the COCO dataset, short for "Common Objects in Context" (Lin et al.). This collection of images has over 200k labeled images separated across 90 classes that include "bird, "cat," "person," and "car."

Now, after that bit of theory, let's take a look at the app.

The app
The app I used is based on the object detection example app for Android provided in the TensorFlow repository. However, I altered it to use the NNAPI and log to a file the inference times, data I used to compare the NNAPI and default TFLITE API's prediction time. Below is the DetectorActivity.java file, responsible for producing the detections—the complete source code is on my GitHub; I'm just showing this file since it has the most changes. In this file, I changed the name of the model (after adding the MobileDet model to the assets directory), changed the variable TF_OD_API_INPUT_SIZE to reflect the input size of MobileDet and set TF_OD_API_IS_QUANTIZED to false since the model is not quantized. Besides this, I added two lists to collect the inference times of the predictions (one list per API), and an override onStop method to dump the lists to a file once the use closes the app. Other small changes I had to do was changing NUM_DETECTIONS from TFLiteObjectDetectionAPIModel.java from 10 to 100 and adding the WRITE_EXTERNAL_STORAGE permission to the Android manifest so that the app could write the files to the Documents directory.


## How to Run



## Tensorflow lite build process
https://www.tensorflow.org/lite/guide/build_cmake

https://juandes.com/pixel-nnapi/