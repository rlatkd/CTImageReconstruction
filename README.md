# CT Image Reconstruction

# **Abstract**

이번 Project에선 medical image를 처리하는 syetem 중 CT의 작동양상 및 image reconstruction에 대해 알아본다. 실제 CT는 안에 대상은 가만히 있고 기계가 돌아가며 image를 얻어내지만, 이번에는 그렇게 할 수 없으니 나만의 image를 회전시켜 data를 얻는다. Image rotating을 위한 function을 개별적으로 만들어 이를 이용한 angle step당 projection data를 얻어 1차적으로 sinogram을 얻어낸다. 그 후 얻어낸 sinogram을 MATLAB의 iradon function을 이용해 back-projectio하여 image를 reconstruction하고, 이 때 filter의 유무와 더 나아가 filter의 종류가 image quality에 어떠한 영향을 미치는지 알아본다. 또한 interpolation의 종류가 image quality에 미치는 영향도 알아본다. 이러한 simulation을 통해 CT image reconstruction을 진행해본다.

# **Introduction**

CT는 X-ray를 이용하여 우리 몸을 진단하는 medical imaging system이다. CT의 구조와 원리를 이해하고 image 처리 방식을 알아본다. CT image를 얻기 위해선 projection data를 기반으로 한 sinogram을 얻어야 하는데, 이를 위해 image를 회전시켜줄 function을 직접 구현한다. 이때 image rotating을 진행하기 전에 image size를 256×256으로 변환해준다.

Sinogram을 얻은 후에는 image reconstruction을 위해 iradon이라는 function을 이용하여 back-projection을 진행하면서 filtered-back-projection과의 image quality 차이를 확인한다.

또한 5종류의 filter를 각각 적용하여 back-projection을 진행하고 original image와의 MSE 값을 비교하여 내가 선택한 image를 reconstruction 할 때 가장 적합한 filter를 찾아내고 다양한 interpolation 방법에 의한 image quality 차이도 알아본다. 마지막으로 image를 회전할 때 angle step마다 reconstruction 되는 image가 얼마나 차이나는지 확인한다.

# **Conclusion**

이번 Project에서는 X-ray가 물체를 통과할 때 생기는 linear attenuation coefficient를 이용하여 우리 몸을 진단하는 의료영상기기인 CT를 modeling하고 simulation하였다. 대상은 가만히 있고 기계가 돌아가며 image를 얻어내는 실제 CT와는 다르게, 내가 선택한 image를 직접 회전시켜 projection data를 얻어냈다.

Image를 회전시키기 위한 function을 구현하여 projection data의 집합인 sinogram을 얻어낼 수 있었다. Sinogram을 얻은 후 다시 back-projection하는 과정에서 image의 size가 감소하는데 이는 iradon function의 option으로 원래의 크기로 맞추어 줄 수 있었다. 또한, back-projection 시에 filter의 유무에 따른 image quality 차이를 알아보고, filter의 종류와 interpolation option에 따른 MSE 값의 차이를 기반으로 내가 선택한 image의 spatial resolution을 가장 좋게 만들 수 있었다. 마지막으로 image를 회전할 때 angle step의 차이에 따라 image가 얼마나 왜곡되는가에 대해서도 직접 확인하였다.

Image를 회전시키며 직접 projection data를 얻고 그것을 reconstruction함으로써 원래의 image를 다시 만들어내는 과정에서 CT의 작동 원리에 대해 더욱더 이해할 수 있었다.

# **Methods**

CT 스캐너는 인체 내부의 3D image를 재현한다. 스캐너는 서로 마주보는 위치에 있는 X-ray 튜브와 검출기로 구성되며 환자 주위를 돌며 360° image 스캔을 한다. 환자가 스캐너 안으로 이동하는 동안 튜브에서 방출된 X-ray가 신체를 통과하며 검출기 array는 반대편에서 감쇠된 X-ray 광자를 캡처하여 여러 각도에서 데이터를 수집한다.