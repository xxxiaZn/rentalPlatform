from rest_framework.decorators import api_view, throttle_classes

from myapp.auth.MyRateThrottle import MyRateThrottle
from myapp.handler import APIResponse
from myapp.serializers import  FankuicontentSerializer


@api_view(['POST'])
@throttle_classes([MyRateThrottle])
def create(request):
    serializer = FankuicontentSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return APIResponse(code=0, msg='创建成功', data=serializer.data)
    else:
        print(serializer.errors)

    return APIResponse(code=1, msg='创建失败')