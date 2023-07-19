========================
***** BLOC PATTERN *****
========================

Bloc pattern ประกอบด้วย 3 ส่วนหลักๆ

- event
- state
- bloc

ส่วน  event  จะรับ trigger event จาก UI ส่งให้ bloc
หลังจาก bloc ทำงานเสร็จจะส่ง state ให้กับทาง UI ผ่าน emit
* bloc version 5^ ไม่จำเป็นต้อง map event กับ state แต่จะ lookup ผ่าน on<Event> แทน

ref: https://medium.com/flutter-community/flutter-bloc-for-beginners-839e22adb9f5

=============================

BlocProvider => inject bloc to context (main.dart)
BlocBuilder => render widget builder
BlocListener =>  listener response when state changes

=============================
***** PROJECT STRUCTURE *****
=============================

--android
--assets
  |--images
  |--theme
--ios
--lib
  |--blocs
  |--models
  |--screens
  |--widgets
  |--services
  |--utils